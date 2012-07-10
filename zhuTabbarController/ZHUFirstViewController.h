//
//  ZHUFirstViewController.h
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/9/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHUViewController.h"

@interface ZHUFirstViewController : ZHUViewController

@property (weak, nonatomic) IBOutlet UIButton *detailBtn1;
@property (weak, nonatomic) IBOutlet UIButton *detailBtn2;
- (IBAction)clickDetailBtn1:(id)sender;
- (IBAction)clickDetailBtn2:(id)sender;
@end
