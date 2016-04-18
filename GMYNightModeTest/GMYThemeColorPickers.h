//
//  GMYThemeColorPickers.h
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GMYThemeManager.h"

GMYThemeColorPicker GMYPickerWithRGB(NSUInteger lightDay,NSUInteger moonNight);
GMYThemeColorPicker GMYPickerWithColor(UIColor *day,UIColor *night);
@interface GMYThemeColorPickers : NSObject



@end
