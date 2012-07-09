//
//  ZHUTabBtn.m
//  zhuTabbarController
//
//  Created by zhukuanxi@gmail.com on 7/9/12.
//  Copyright (c) 2012 tencent. All rights reserved.
//

#import "ZHUTabBtn.h"
#import "ZHUBadgeView.h"

@implementation ZHUTabBtn
@synthesize badgeView = _badgeView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected 
{
    [super setSelected:selected];
    if (self.badgeView) {
        self.badgeView.isSelect = selected;
    }
}

- (ZHUBadgeView *)badgeView
{
    if (!_badgeView) {
        _badgeView = [[ZHUBadgeView alloc] initWithSuperView:self];
        [self addSubview:_badgeView];
    }
    return _badgeView;
}

- (void)setBadgeString:(NSString *)badgeValue {
    if (self.badgeView) {
        [self.badgeView setBadgeString:badgeValue];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
