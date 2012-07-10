//
//  ZHUFirstViewController.m
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/9/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

#import "ZHUFirstViewController.h"
#import "ZHUAppDelegate.h"
#import "ZHUDetailViewController.h"

@interface ZHUFirstViewController ()
- (void)changeBadge:(id)sender;
- (void)hideTab:(id)sender;
@end

@implementation ZHUFirstViewController
@synthesize detailBtn1 = _detailBtn1;
@synthesize detailBtn2 = _detailBtn2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Badge", @"Badge") 
                                                                              style:UIBarButtonItemStylePlain 
                                                                             target:self
                                                                             action:@selector(changeBadge:)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"HideTab", @"HideTab") 
                                                                              style:UIBarButtonItemStylePlain 
                                                                             target:self
                                                                             action:@selector(hideTab:)];
    
    [self.detailBtn1 setTitle:NSLocalizedString(@"DetailNormal", @"DetailNormal") forState:UIControlStateNormal];
    
    [self.detailBtn2 setTitle:NSLocalizedString(@"DetailHideBottom", @"DetailHideBottom") forState:UIControlStateNormal];
    [self.detailBtn1 sizeToFit];
    self.detailBtn1.center = CGPointMake(self.view.center.x, self.detailBtn1.center.y);
    
    [self.detailBtn2 sizeToFit];
        self.detailBtn2.center = CGPointMake(self.view.center.x, self.detailBtn2.center.y);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)clickDetailBtn1:(id)sender
{
    ZHUDetailViewController *detailCtl = [[ZHUDetailViewController alloc] initWithNibName:@"ZHUDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailCtl animated:YES];
}

- (IBAction)clickDetailBtn2:(id)sender
{
    ZHUDetailViewController *detailCtl = [[ZHUDetailViewController alloc] initWithNibName:@"ZHUDetailViewController" bundle:nil];
    detailCtl.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailCtl animated:YES];
}

- (void)changeBadge:(id)sender 
{
    ZHUAppDelegate *appDel = (ZHUAppDelegate *)[[UIApplication sharedApplication] delegate];
    ZHUTabBarViewController *tabCtl = (ZHUTabBarViewController *)[appDel tabBarController];
    [tabCtl.viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIViewController *viewCtl = obj;
        viewCtl.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", random() % 1000];
        [tabCtl setBadgeValueForController:viewCtl];
    }];
}

- (void)hideTab:(id)sender {
    ZHUAppDelegate *appDel = (ZHUAppDelegate *)[[UIApplication sharedApplication] delegate];
    ZHUTabBarViewController *tabCtl = (ZHUTabBarViewController *)[appDel tabBarController];
    [tabCtl hideTabbar:!tabCtl.isHide animated:YES];
}
@end
