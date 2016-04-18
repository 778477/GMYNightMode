//
//  UIBarButtonItem+GMYTheme.m
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "UIBarButtonItem+GMYTheme.h"

@implementation UIBarButtonItem (GMYTheme)
@dynamic gmy_tintColorPicker;

- (void)setGmy_tintColorPicker:(GMYThemeColorPicker)gmy_tintColorPicker{
    self.tintColor = gmy_tintColorPicker();
    [self.themes setValue:[gmy_tintColorPicker copy] forKey:@"setTintColor:"];
}
@end
