//
//  UIView+JDFPulseAnimations.h
//  JDFViewAnimations
//
//  Created by Joe Fryer on 05/02/2015.
//  Copyright (c) 2015 Joe Fryer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JDFPulseAnimations)

#pragma mark - Generic Pulse Animation

- (void)jdf_pulseViewWithMaximumScale:(CGFloat)maximumScale minimumScale:(CGFloat)minimumScale oscillations:(NSInteger)oscillations duration:(NSTimeInterval)duration;
- (void)jdf_pulseViewWithMaximumScale:(CGFloat)maximumScale minimumScale:(CGFloat)minimumScale oscillations:(NSInteger)oscillations duration:(NSTimeInterval)duration completionBlock:(void(^)())completionBlock;

#pragma mark - Convenience - Pre-defined Pulse Animations

- (void)jdf_shortQuickSinglePulseAnimation;
- (void)jdf_shortQuickSinglePulseAnimationWithCompletionBlock:(void(^)())completionBlock;

- (void)jdf_mediumPulseAnimation;
- (void)jdf_mediumPulseAnimationWithCompletionBlock:(void(^)())completionBlock;

- (void)jdf_largePulseAnimation;
- (void)jdf_largePulseAnimationWithCompletionBlock:(void(^)())completionBlock;

@end
