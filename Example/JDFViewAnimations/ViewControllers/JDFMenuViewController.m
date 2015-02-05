//
//  JDFMenuViewController.m
//  JDFViewAnimations
//
//  Created by Joe Fryer on 05/02/2015.
//  Copyright (c) 2015 Joe Fryer. All rights reserved.
//

#import "JDFMenuViewController.h"

// View Controllers
#import "JDFShakeAnimationViewController.h"


// Menu Items
static NSString *const JDFMenuViewControllerTableItemShake = @"Shake";
static NSString *const JDFMenuViewControllerTableItemPulse = @"Pulse";

// Identifiers
static NSString *const JDFMenuViewControllerCellIdentifier = @"JDFMenuViewControllerCellIdentifier";



@interface JDFMenuViewController ()

@property (nonatomic, strong) NSArray *menuItems;

@end



@implementation JDFMenuViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Animations Menu";
    
    self.menuItems = @[JDFMenuViewControllerTableItemShake, JDFMenuViewControllerTableItemPulse];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:JDFMenuViewControllerCellIdentifier];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JDFMenuViewControllerCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.menuItems[indexPath.row];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *menuItem = self.menuItems[indexPath.row];
    
    if ([menuItem isEqualToString:JDFMenuViewControllerTableItemShake]) {
        JDFShakeAnimationViewController *shakeViewController = [[JDFShakeAnimationViewController alloc] init];
        shakeViewController.navigationItem.title = menuItem;
        [self.navigationController pushViewController:shakeViewController animated:YES];
    }
}

@end
