//
//  GMYDeallocExector.h
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMYDeallocExector : NSObject

+ (instancetype)exectorWithDeallocBlock:(void(^)())deallocBlock;

@property (nonatomic, copy) void (^deallocBlock)();

@end
