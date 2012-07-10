//
//  ZHUViewController.m
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/10/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

#import "ZHUViewController.h"

@interface ZHUViewController ()

@end

@implementation ZHUViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.hidesBottomBarWhenPushed) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNofityHideTabBar object:self];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.hidesBottomBarWhenPushed) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNofityShowTabBar object:self];
    }
}
@end
