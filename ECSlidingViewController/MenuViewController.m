//
//  MenuViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController()
@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSArray *profileMenuItems;
@property (nonatomic, strong) NSArray *tabsMenuItems;
@property (nonatomic, strong) NSArray *menuItems;
@end

@implementation MenuViewController
@synthesize sectionTitles, profileMenuItems, tabsMenuItems, menuItems;

- (void)awakeFromNib
{
    self.sectionTitles = [NSArray arrayWithObjects:@"Mya", @"Apps", @"Account", nil];
    
    self.profileMenuItems = [NSArray arrayWithObjects:@"Profile", nil];
    self.tabsMenuItems = [NSArray arrayWithObjects:@"Messages", @"Challenges", @"Trackers", nil];
    self.menuItems = [NSArray arrayWithObjects:@"Settings", @"Logout", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    [self.slidingViewController setAnchorRightRevealAmount:280.0f];
    self.slidingViewController.underLeftWidthLayout = ECFixedRevealWidth;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionTitles.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0) {
        return self.profileMenuItems.count;
    }
    else if (sectionIndex == 1) {
        return self.tabsMenuItems.count;
    }
    else if (sectionIndex == 2) {
        return self.menuItems.count;
    }
    return 0;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sectionTitles objectAtIndex:section];
}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
    
    // Create label with section title
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 0, 284, 23);
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:12];
    label.text = sectionTitle;
    label.backgroundColor = [UIColor clearColor];
    // Create header view and add label as a subview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    view.backgroundColor = [UIColor darkGrayColor];
    [view addSubview:label];
    
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [self.profileMenuItems objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [self.tabsMenuItems objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.textLabel.text = [self.menuItems objectAtIndex:indexPath.row];
            break;
    }
  
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
    cell.backgroundColor = [UIColor grayColor];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *identifier = [NSString stringWithFormat:@"%@Top", [self.menuItems objectAtIndex:indexPath.row]];

  UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
  
  [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
    CGRect frame = self.slidingViewController.topViewController.view.frame;
    self.slidingViewController.topViewController = newTopViewController;
    self.slidingViewController.topViewController.view.frame = frame;
    [self.slidingViewController resetTopView];
  }];
}

@end
