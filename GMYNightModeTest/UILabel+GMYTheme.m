//
//  UILabel+GMYTheme.m
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "UILabel+GMYTheme.h"
#import <objc/runtime.h>
@implementation UILabel (GMYTheme)
@dynamic gmy_TextColorPicker;

- (void)setGmy_TextColorPicker:(GMYThemeColorPicker)gmy_TextColorPicker{
    self.textColor = gmy_TextColorPicker();
    [self.themes setValue:[gmy_TextColorPicker copy] forKey:@"setTextColor:"];
}
@end
