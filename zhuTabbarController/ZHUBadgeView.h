//
//  ZHUBadgeView.h
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/9/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHUBadgeView : UIView {
    CGFloat _offsetToIcon;
}
@property (nonatomic, copy) NSString *badgeString;
@property (nonatomic, retain) UIColor *badgeTextColor;
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, retain) UIColor *badgeFillColor;
@property (nonatomic, retain) UIColor *badgeSelectFillColor;
@property (nonatomic, retain) UIColor *badgeEdgeColor;
@property (nonatomic, assign) BOOL isShinning;
@property (nonatomic, assign) BOOL isEdge;
@property (nonatomic, assign) CGFloat defaultWidth;
- (id)initWithSuperView:(UIView *)superview;
@end
