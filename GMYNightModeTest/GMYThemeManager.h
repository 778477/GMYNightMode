//
//  GMYThemeManager.h
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString * const kGMYThemeChangeNotiaication;

typedef UIColor *(^GMYThemeColorPicker)();

typedef NS_ENUM(NSUInteger, GMYTheme) {
    GMYLightDayTheme = 0,
    GMYMoonNightTheme
};

@interface GMYThemeManager : NSObject
@property (nonatomic, assign, getter=currentTheme,setter=changeTheme:) GMYTheme theme;
+ (GMYThemeManager *)shareThemeManager;

@end
