//
//  NSObject+GMYTheme.m
//  GMYNightModeTest
//
//  Created by miaoyou.gmy on 16/4/18.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "NSObject+GMYTheme.h"
#import <objc/runtime.h>
#import "GMYDeallocExector.h"

static const void * kNSObjectGMYThemesBindingKey;

static const void * kNSObjectGMYDeallocHelperKey;

@interface NSObject()


@end

@implementation NSObject (GMYTheme)
@dynamic themes;

- (NSMutableDictionary<NSString *,GMYThemeColorPicker> *)themes{
    id dict = objc_getAssociatedObject(self, &kNSObjectGMYThemesBindingKey);
    if(!dict){
        dict = [NSMutableDictionary dictionaryWithCapacity:1];
        /**
         *      In iOS8 and early version post a notification to dealloced observer Will Crash.
         *      but this fixed in iOS9 By Apple
         */
        {
            if(!objc_getAssociatedObject(self, &kNSObjectGMYDeallocHelperKey)){
                __unsafe_unretained typeof(self) uuSelf = self;
                id exector = [GMYDeallocExector exectorWithDeallocBlock:^{
                    [[NSNotificationCenter defaultCenter] removeObserver:uuSelf];
                }];
                objc_setAssociatedObject(self, &kNSObjectGMYDeallocHelperKey, exector, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
        }
        
        objc_setAssociatedObject(self, &kNSObjectGMYThemesBindingKey, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [[NSNotificationCenter defaultCenter] removeObserver:self name:kGMYThemeChangeNotiaication object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateWithTheme:) name:kGMYThemeChangeNotiaication object:nil];
    }
    
    return dict;
}


- (void)updateWithTheme:(NSNotification *)notif{
    NSDictionary *dict = self.themes;
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, GMYThemeColorPicker obj, BOOL * _Nonnull stop) {
        
        [UIView animateWithDuration:0.3f animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:NSSelectorFromString(key) withObject:obj()];
#pragma clang diagnostic pop
        }];
    }];
}

@end
