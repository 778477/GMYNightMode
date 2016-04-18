//
//  GMYThemeManager.m
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "GMYThemeManager.h"
static GMYThemeManager *manager = nil;
NSString * const kGMYThemeChangeNotiaication = @"kGMYThemeChangeNotiaication";
@interface GMYThemeManager ()

@end

@implementation GMYThemeManager
@synthesize theme = _theme;
#pragma mark - Life Cycle
- (instancetype)init{
    self = [super init];
    if(self){
        _theme = GMYLightDayTheme;
        NSLog(@"GMYThemeManager inited ...");
    }
    return self;
}

+ (GMYThemeManager *)shareThemeManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [GMYThemeManager new];
    });
    
    return manager;
}

#pragma mark - 
- (void)changeTheme:(GMYTheme)theme{
    if(theme == self.theme){
        return;
    }
    _theme = theme;
    [[NSNotificationCenter defaultCenter] postNotificationName:kGMYThemeChangeNotiaication object:nil];
}
- (GMYTheme)currentTheme{
    return _theme;
}

@end
