//
//  UIView+JDFPulseAnimations.m
//  JDFViewAnimations
//
//  Created by Joe Fryer on 05/02/2015.
//  Copyright (c) 2015 Joe Fryer. All rights reserved.
//

#import "UIView+JDFPulseAnimations.h"

@implementation UIView (JDFPulseAnimations)

- (void)jdf_pulseViewWithMaximumScale:(CGFloat)maximumScale minimumScale:(CGFloat)minimumScale oscillations:(NSInteger)oscillations duration:(NSTimeInterval)duration completionBlock:(void (^)())completionBlock
{
    [CATransaction begin];
    if (completionBlock) {
        [CATransaction setCompletionBlock:completionBlock];
    }
    
    CATransform3D transform = self.layer.transform;
    CGFloat upperIncrement = (maximumScale - 1.0f) / (oscillations + 1);
    CGFloat lowerIncrement = (1.0f - minimumScale) / (oscillations + 1);
    
    NSMutableArray *timingFunctions = [NSMutableArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], nil];
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:transform]];
    for (NSInteger i = 0; i < oscillations; i++) {
        CGFloat upperScale = maximumScale - (i * upperIncrement);
        CGFloat lowerScale = minimumScale + (i * lowerIncrement);
        NSLog(@"Upper: %f Lower: %f", upperScale, lowerScale);
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DScale(transform, upperScale, upperScale, 1.0f)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DScale(transform, lowerScale, lowerScale, 1.0f)]];
        [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    }
    [values addObject:[NSValue valueWithCATransform3D:transform]];
    
    CAKeyframeAnimation *pulseAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    pulseAnimation.duration = duration;
    pulseAnimation.values = values;
    pulseAnimation.removedOnCompletion = YES;
    pulseAnimation.timingFunctions = timingFunctions;
    
    [self.layer addAnimation:pulseAnimation forKey:@"pulse"];
    
    [CATransaction commit];
}

- (void)jdf_pulseViewWithMaximumScale:(CGFloat)maximumScale minimumScale:(CGFloat)minimumScale oscillations:(NSInteger)oscillations duration:(NSTimeInterval)duration
{
    [self jdf_pulseViewWithMaximumScale:maximumScale minimumScale:minimumScale oscillations:oscillations duration:duration completionBlock:nil];
}

@end
