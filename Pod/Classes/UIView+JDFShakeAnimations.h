//
//  UIView+JDFShakeAnimations.h
//  JDFViewAnimations
//
//  Created by Joe Fryer on 11/11/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JDFShakeAnimations)

+ (void)shakeViews:(NSArray *)views distance:(CGFloat)distance times:(NSInteger)times eachShakeTimeInterval:(NSTimeInterval)timeInterval completionBlock:(void(^)())completionBlock;

- (void)shakeByDistance:(CGFloat)shakeDistance times:(NSInteger)times eachShakeTimeInterval:(NSTimeInterval)timeInterval completionBlock:(void(^)())completionBlock;

@end
