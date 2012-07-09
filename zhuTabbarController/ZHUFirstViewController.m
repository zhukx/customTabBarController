//
//  ZHUFirstViewController.m
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/9/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

#import "ZHUFirstViewController.h"
#import "ZHUAppDelegate.h"

@interface ZHUFirstViewController ()
- (void)changeBadge:(id)sender;
@end

@implementation ZHUFirstViewController

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

@end
