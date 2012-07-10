//
//  ZHUTabBarViewController.m
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/9/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

#import "ZHUTabBarViewController.h"
#import "ZHUDef.h"
@interface ZHUTabBarViewController ()
- (void)hideRealTabBar;
- (void)createCustomTabBar;
- (void)initNotify;
@end

@implementation ZHUTabBarViewController
@synthesize customTabBar = _customTabBar;
@synthesize isHide = _isHide;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _isHide = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self hideRealTabBar];
    [self initNotify];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc 
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)initNotify 
{
    [[NSNotificationCenter defaultCenter] addObserverForName:kNofityHideTabBar
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      [self hideTabbar:YES animated:YES];
                                                  }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kNofityShowTabBar
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      [self hideTabbar:NO animated:YES];
                                                  }];
}

- (void)hideRealTabBar
{
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIView *subView = obj;
        if ([subView isKindOfClass:[UITabBar class]]) {
            subView.hidden = YES;
            *stop = YES;
        }
    }];
}

- (void)createCustomTabBar {
    self.customTabBar = [[ZHUTabBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - kDefaultTabbarHeight, self.view.frame.size.width, kDefaultTabbarHeight) 
                                                tabItems:self.viewControllers];
    self.customTabBar.delegate = self;
    self.customTabBar.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.customTabBar];
    [self.customTabBar moveIndicatorToIndex:self.selectedIndex animated:YES];
}

- (void)setBadgeValueForController:(UIViewController *)ctl {
    [self.customTabBar setBadgeValue:ctl.tabBarItem.badgeValue atIndex:[self.viewControllers indexOfObject:ctl]];
}

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated
{
    [super setViewControllers:viewControllers animated:animated];
    [self createCustomTabBar];
}

- (void)hideTabbar:(BOOL)hide animated:(BOOL)animated
{
    [self hideRealTabBar];
    _isHide = hide;
    if (hide) {
        if (animated) {
            [UIView animateWithDuration:0.3
                                  delay:0 
                                options:UIViewAnimationOptionCurveEaseInOut 
                             animations:^{
                                 self.customTabBar.frame = CGRectMake(0, self.view.frame.size.height,
                                                            self.customTabBar.frame.size.width, self.customTabBar.frame.size.height);
                             } completion:^(BOOL finished) {
                                 
                             }];
        }
        else {
            self.customTabBar.frame = CGRectMake(0, self.view.frame.size.height,
                                       self.customTabBar.frame.size.width, self.customTabBar.frame.size.height);
        }
    }
    else {
        if (animated) {
            [UIView animateWithDuration:0.3
                                  delay:0 
                                options:UIViewAnimationOptionCurveEaseInOut 
                             animations:^{
                                 self.customTabBar.frame = CGRectMake(0, self.view.frame.size.height - kDefaultTabbarHeight,
                                                            self.customTabBar.frame.size.width, self.customTabBar.frame.size.height);
                             } completion:^(BOOL finished) {
                                 
                             }];
        }
        else {
            self.customTabBar.frame = CGRectMake(0, self.view.frame.size.height - kDefaultTabbarHeight,
                                       self.customTabBar.frame.size.width, self.customTabBar.frame.size.height);
        }
    }
}

#pragma - ZHUTabBarDelegate
- (void)tabBar:(ZHUTabBar *)tabBar didSelectIndex:(NSInteger)index
{
	if (self.selectedIndex == index) {
		[[self.viewControllers objectAtIndex:self.selectedIndex] popToRootViewControllerAnimated:YES];
		return;
	}
    
    UIViewController *viewCtl = [self.viewControllers objectAtIndex:index];
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)]) {
        if (![self.delegate tabBarController:self shouldSelectViewController:viewCtl]) {
            return;
        }
    }
	self.selectedIndex = index;
    [self.customTabBar moveIndicatorToIndex:self.selectedIndex animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
        [self.delegate tabBarController:self didSelectViewController:viewCtl];
    }
}
@end
