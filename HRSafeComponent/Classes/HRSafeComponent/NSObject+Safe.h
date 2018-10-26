//
//  NSObject+Safe.h
// https://github.com/lsmakethebest/LSSafeProtector
//
//  Created by lz on 2017/4/20.
//  Copyright © 2018年 lz. All rights reserved.
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


#define  HRLog(fmt, ...)  NSLog(fmt, ##__VA_ARGS__)
#define  HRCatchCrashLog(exception,crash)   [NSObject safe_logCrashWithException:exception crashType:crash]

//NSNotificationCenter 即使设置LogTypeAll 也不会打印，
//iOS9之后系统已经优化了，即使不移除也不会崩溃， 所以仅iOS8系统会出现此类型carsh,但是有的类是在dealloc里移除通知，而我们是在所有类的dealloc方法之前检测是否移除，没移除则去移除所以会误报crash，干脆直接不报此类型crash了

typedef enum : NSUInteger {
    HRSafeCatchLogTypeNone,//所有log都不打印
    HRSafeCatchLogTypeAll,//打印所有log
} HRSafeCatchLogType;

//不同类型的crash
typedef enum : NSUInteger {
    HRSafeCatchCrashTypeSelector,
    HRSafeCatchCrashTypeKVO,
    HRSafeCatchCrashTypeNSArray,
    HRSafeCatchCrashTypeNSMutableArray,
    HRSafeCatchCrashTypeNSDictionary,
    HRSafeCatchCrashTypeNSMutableDictionary,
    HRSafeCatchCrashTypeNSStirng,
    HRSafeCatchCrashTypeNSMutableString,
    HRSafeCatchCrashTypeNSAttributedString,
    HRSafeCatchCrashTypeNSMutableAttributedString,
    HRSafeCatchCrashTypeNSNotificationCenter,
    
} HRSafeCatchCrashType;


/**
 回调错误信息

 @param exception 错误信息
 @param crashType 崩溃类型
 @param fullErrorMsg 崩溃堆栈日志
 */
typedef void(^HRSafeCatchBlock)(NSException *exception,HRSafeCatchCrashType crashType,NSString *fullErrorMsg);

@interface  NSObject (Safe)

//打开目前所支持的所有安全保护 回调block
+ (void)openAllSafeProtectorWithIsDebug:(BOOL)isDebug block:(HRSafeCatchBlock)block;

//打开当前类安全保护
+ (void)openSafeProtector;

//交换类方法
+ (void)safe_exchangeClassMethod:(Class)dClass    originalSel:(SEL)originalSelector newSel:(SEL)newSelector;

//交换对象方法
+ (void)safe_exchangeInstanceMethod:(Class)dClass originalSel:(SEL)originalSelector newSel: (SEL)newSelector;

//打印crash信息
+ (void)safe_logCrashWithException:(NSException *)exception crashType:(HRSafeCatchCrashType)crashType;


@end



