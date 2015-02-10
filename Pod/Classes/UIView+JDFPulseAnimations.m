//
//  UIView+JDFPulseAnimations.m
//  JDFViewAnimations
//
//  Created by Joe Fryer on 05/02/2015.
//  Copyright (c) 2015 Joe Fryer. All rights reserved.
//

#import "UIView+JDFPulseAnimations.h"

@implementation UIView (JDFPulseAnimations)

#pragma mark - Pulse Animation

- (void)jdf_pulseViewWithMaximumScale:(CGFloat)maximumScale minimumScale:(CGFloat)minimumScale oscillations:(NSInteger)oscillations duration:(NSTimeInterval)duration
{
    [self jdf_pulseViewWithMaximumScale:maximumScale minimumScale:minimumScale oscillations:oscillations duration:duration completionBlock:nil];
}

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


#pragma mark - Convenience - Pre-defined animations

- (void)jdf_shortQuickSinglePulseAnimation
{
    [self jdf_shortQuickSinglePulseAnimationWithCompletionBlock:nil];
}

- (void)jdf_shortQuickSinglePulseAnimationWithCompletionBlock:(void (^)())completionBlock
{
    [self jdf_pulseViewWithMaximumScale:1.05 minimumScale:0.95 oscillations:1 duration:0.25 completionBlock:completionBlock];
}

- (void)jdf_mediumPulseAnimation
{
    [self jdf_mediumPulseAnimationWithCompletionBlock:nil];
}

- (void)jdf_mediumPulseAnimationWithCompletionBlock:(void (^)())completionBlock
{
    [self jdf_pulseViewWithMaximumScale:1.15 minimumScale:0.9 oscillations:2 duration:0.4 completionBlock:completionBlock];
}

- (void)jdf_largePulseAnimation
{
    [self jdf_largePulseAnimationWithCompletionBlock:nil];
}

- (void)jdf_largePulseAnimationWithCompletionBlock:(void (^)())completionBlock
{
    [self jdf_pulseViewWithMaximumScale:1.3 minimumScale:0.75 oscillations:2 duration:0.5 completionBlock:completionBlock];
}

@end
