//
//  GMYDeallocExector.m
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "GMYDeallocExector.h"

@implementation GMYDeallocExector

+ (instancetype)exectorWithDeallocBlock:(void (^)())deallocBlock{
    GMYDeallocExector *exector = [GMYDeallocExector new];
    exector.deallocBlock = [deallocBlock copy];
    
    return exector;
}

- (void)dealloc{
    if(self.deallocBlock){
        NSLog(@"deallocing ...");
        self.deallocBlock();
        self.deallocBlock = nil;
    }
}

@end
