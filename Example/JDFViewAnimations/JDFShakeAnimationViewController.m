//
//  JDFViewController.m
//  JDFViewAnimations
//
//  Created by Joe Fryer on 11/11/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import "JDFShakeAnimationViewController.h"

// Categories
#import "UIView+JDFShakeAnimations.h"


@interface JDFShakeAnimationViewController ()

@property (nonatomic, strong) UIImageView *maracasImageView;

@end


@implementation JDFShakeAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = 200.0f;
    self.maracasImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Maracas.png"]];
    self.maracasImageView.frame = CGRectMake((self.view.frame.size.width / 2) - (width / 2), self.view.frame.size.height * 0.15f, width, width);
    [self.view addSubview:self.maracasImageView];
    
    CGFloat buttonWidth = 200.0f;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Shake the Maracas!" forState:UIControlStateNormal];
    button.frame = CGRectMake((self.view.frame.size.width / 2) - (buttonWidth / 2), CGRectGetMaxY(self.maracasImageView.frame) + 50.0f, buttonWidth, 30.0f);
    [button addTarget:self action:@selector(shakeTheMaracasButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"Shake them quickly!" forState:UIControlStateNormal];
    button2.frame = CGRectMake((self.view.frame.size.width / 2) - (buttonWidth / 2), CGRectGetMaxY(button.frame) + 30.0f, buttonWidth, 30.0f);
    [button2 addTarget:self action:@selector(shakeQuicklyButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button2];

}

- (void)shakeTheMaracasButtonPressed:(UIButton *)sender
{
    [self.maracasImageView shakeByDistance:10.0f times:10 eachShakeTimeInterval:0.1 completionBlock:^{
        NSLog(@"Finished Shaking");
    }];
}

- (void)shakeQuicklyButtonPressed:(UIButton *)sender
{
    [self.maracasImageView shakeByDistance:7.0f times:10 eachShakeTimeInterval:0.05 completionBlock:^{
        NSLog(@"Finished Shaking Quickly");
    }];
}

@end
