//
//  GMYThemeColorPickers.m
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "GMYThemeColorPickers.h"

@implementation GMYThemeColorPickers

GMYThemeColorPicker GMYPickerWithRGB(NSUInteger lightDay,NSUInteger moonNight){
    UIColor *normalColor = [UIColor colorWithRed:((float)((lightDay & 0xFF0000) >> 16))/255.0
                                           green:((float)((lightDay & 0xFF00) >> 8))/255.0
                                            blue:((float)(lightDay & 0xFF))/255.0
                                           alpha:1.0];
    
    
    UIColor *nightColor = [UIColor colorWithRed:((float)((moonNight & 0xFF0000) >> 16))/255.0
                                          green:((float)((moonNight & 0xFF00) >> 8))/255.0
                                           blue:((float)(moonNight & 0xFF))/255.0
                                          alpha:1.0];
    
    return GMYPickerWithColor(normalColor, nightColor);
    
}

GMYThemeColorPicker GMYPickerWithColor(UIColor *day,UIColor *night){
    return ^(){
        return [GMYThemeManager shareThemeManager].currentTheme == GMYLightDayTheme ? day : night;
    };
}

@end
