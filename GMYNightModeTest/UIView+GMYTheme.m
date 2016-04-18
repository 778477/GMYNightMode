//
//  UIView+GMYTheme.m
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "UIView+GMYTheme.h"
#import <objc/runtime.h>
@implementation UIView (GMYTheme)
@dynamic gmy_tintColorPicker;
@dynamic gmy_backGroundColorPicker;

- (void)setGmy_tintColorPicker:(GMYThemeColorPicker)gmy_tintColorPicker{
    self.tintColor = gmy_tintColorPicker();
    [self.themes setValue:[gmy_tintColorPicker copy] forKey:@"setTintColor:"];
}

- (void)setGmy_backGroundColorPicker:(GMYThemeColorPicker)gmy_backGroundColorPicker{
    self.backgroundColor = gmy_backGroundColorPicker();
    [self.themes setValue:[gmy_backGroundColorPicker copy] forKey:@"setBackgroundColor:"];
}
@end
