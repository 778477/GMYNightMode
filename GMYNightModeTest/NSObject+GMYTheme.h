//
//  NSObject+GMYTheme.h
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMYThemeManager.h"

@interface NSObject (GMYTheme)

@property (nonatomic, strong, readonly) NSMutableDictionary <NSString *,GMYThemeColorPicker> *themes;

@end
