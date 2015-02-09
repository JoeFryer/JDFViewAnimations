//
//  UIView+JDFPulseAnimations.h
//  JDFViewAnimations
//
//  Created by Joe Fryer on 05/02/2015.
//  Copyright (c) 2015 Joe Fryer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JDFPulseAnimations)

- (void)jdf_pulseViewWithMaximumScale:(CGFloat)maximumScale minimumScale:(CGFloat)minimumScale oscillations:(NSInteger)oscillations duration:(NSTimeInterval)duration;
- (void)jdf_pulseViewWithMaximumScale:(CGFloat)maximumScale minimumScale:(CGFloat)minimumScale oscillations:(NSInteger)oscillations duration:(NSTimeInterval)duration completionBlock:(void(^)())completionBlock;

@end
