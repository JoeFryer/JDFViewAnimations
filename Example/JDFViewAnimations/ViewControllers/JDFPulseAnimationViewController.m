//
//  JDFPulseAnimationViewController.m
//  JDFViewAnimations
//
//  Created by Joe Fryer on 05/02/2015.
//  Copyright (c) 2015 Joe Fryer. All rights reserved.
//

#import "JDFPulseAnimationViewController.h"

// Categories
#import "UIView+JDFPulseAnimations.h"


@interface JDFPulseAnimationViewController ()

@property (nonatomic, strong) UIView *circleView;
@end


@implementation JDFPulseAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = 200.0f;
    self.circleView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - (width / 2), self.view.frame.size.height * 0.15f, width, width)];
    self.circleView.backgroundColor = [UIColor colorWithRed:0.79 green:0.26 blue:0.33 alpha:1];
    self.circleView.layer.cornerRadius = width / 2;
    self.circleView.layer.masksToBounds = YES;
    [self.view addSubview:self.circleView];
    
    CGFloat buttonWidth = 200.0f;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Pulse!" forState:UIControlStateNormal];
    button.frame = CGRectMake((self.view.frame.size.width / 2) - (buttonWidth / 2), CGRectGetMaxY(self.circleView.frame) + 50.0f, buttonWidth, 30.0f);
    [button addTarget:self action:@selector(pulseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"More pulse..." forState:UIControlStateNormal];
    button2.frame = CGRectMake((self.view.frame.size.width / 2) - (buttonWidth / 2), CGRectGetMaxY(button.frame) + 30.0f, buttonWidth, 30.0f);
    [button2 addTarget:self action:@selector(morePulseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"All the pulse!" forState:UIControlStateNormal];
    button3.frame = CGRectMake((self.view.frame.size.width / 2) - (buttonWidth / 2), CGRectGetMaxY(button2.frame) + 30.0f, buttonWidth, 30.0f);
    [button3 addTarget:self action:@selector(allThePulseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button3];
}

- (void)pulseButtonPressed:(UIButton *)sender
{
    [self.circleView jdf_shortQuickSinglePulseAnimation];
}

- (void)morePulseButtonPressed:(UIButton *)sender
{
    [self.circleView jdf_mediumPulseAnimation];
}

- (void)allThePulseButtonPressed:(UIButton *)sender
{
    [self.circleView jdf_largePulseAnimation];
}

@end
