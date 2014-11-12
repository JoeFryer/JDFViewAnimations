//
//  UIView+JDFShakeAnimations.m
//  JDFViewAnimations
//
//  Created by Joe Fryer on 11/11/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import "UIView+JDFShakeAnimations.h"

@implementation UIView (JDFShakeAnimations)

#pragma mark - Public

+ (void)shakeViews:(NSArray *)views distance:(CGFloat)distance times:(NSInteger)times eachShakeTimeInterval:(NSTimeInterval)timeInterval completionBlock:(void (^)())completionBlock
{
    [CATransaction begin];
    if (completionBlock) {
        [CATransaction setCompletionBlock:completionBlock];
    }
    for (UIView *view in views) {
        if (![view isKindOfClass:[UIView class]]) {
            continue;
        }
        [view shakeByDistance:distance times:times eachShakeTimeInterval:timeInterval completionBlock:nil useTransaction:NO];
    }
    [CATransaction commit];
}

- (void)shakeByDistance:(CGFloat)shakeDistance times:(NSInteger)times eachShakeTimeInterval:(NSTimeInterval)timeInterval completionBlock:(void (^)())completionBlock
{
    [self shakeByDistance:shakeDistance times:times eachShakeTimeInterval:timeInterval completionBlock:completionBlock useTransaction:YES];
}


#pragma mark - Internal

- (void)shakeByDistance:(CGFloat)shakeDistance times:(NSInteger)times eachShakeTimeInterval:(NSTimeInterval)timeInterval completionBlock:(void (^)())completionBlock useTransaction:(BOOL)useTransaction
{
    if (useTransaction) {
        [CATransaction begin];
        if (completionBlock) {
            [CATransaction setCompletionBlock:completionBlock];
        }
    }
    CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    shakeAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x - shakeDistance, self.center.y)];
    shakeAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x + shakeDistance, self.center.y)];
    shakeAnimation.duration = timeInterval;
    shakeAnimation.autoreverses = YES;
    shakeAnimation.repeatCount = times;
    
    [self.layer addAnimation:shakeAnimation forKey:@"position"];
    
    if (useTransaction) {
        [CATransaction commit];
    }
}

@end
