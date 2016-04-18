# DKNightVersion 读码笔记
---

## First Point

[How Not to Crash #3: NSNotification](http://inessential.com/2015/05/21/how_not_to_crash_3_nsnotification)

** The One Way to Crash **


> When an object registers for a notification, and then is deallocated without unregistering, then the app will crash if that notification is posted. That’s the thing you need to avoid.  The rest of this article describes how to do that.

**Discussion**

```Be sure to invoke removeObserver:name:object: before notificationObserver or any object specified in addObserver:selector:name:object: is deallocated.```



当我在iOS9的模拟器下测试的时候，惊讶的发现：对一个已经释放的对象 post一个notification已经不会触发crash。

iOS8.3上依旧是会Crash的。

显然Apple在iOS9意识到NSNotificationCenter对一个dealloced对象post一个消息是一件很蠢的事情。

在阅读DKNightVersion的源码的时候，发现了一段很有意思的代码:

`NSObject+Night.m`

```
@autoreleasepool {
            // Need to removeObserver in dealloc
            if (objc_getAssociatedObject(self, &DKViewDeallocHelperKey) == nil) {
                __unsafe_unretained typeof(self) weakSelf = self; // NOTE: need to be __unsafe_unretained because __weak var will be reset to nil in dealloc
                id deallocHelper = [self addDeallocBlock:^{
                    [[NSNotificationCenter defaultCenter] removeObserver:weakSelf];
                }];
                objc_setAssociatedObject(self, &DKViewDeallocHelperKey, deallocHelper, OBJC_ASSOCIATION_ASSIGN);
            }
        }
```

`DKDeallocBlockExecutor.m`

```
- (void)dealloc {
    if (self.deallocBlock) {
        self.deallocBlock();
        self.deallocBlock = nil;
    }
}
```

大体作用是 给`NSObject` 绑定一个`DKDeallocBlockExecutor` *(这个名起的特别好)*,遗嘱执行人有一个block 回调，这个回调就定义最重要的部分：

```
[[NSNotificationCenter defaultCenter] removeObserver:weakSelf];
```

在对象dealloc的时候，遗嘱执行人会从NSNotificationCenter注销掉观察者。基本上对象要挂了，想做什么事情可以拜托这位 **DKDeallocBlockExecutor**


