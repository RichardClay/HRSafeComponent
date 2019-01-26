
#import "NSArray+Safe.h"
#import <objc/runtime.h>
#import "NSObject+Safe.h"


@implementation NSArray (Safe)

+(void)openSafeProtector
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_exchangeInstanceMethod:objc_getClass("__NSPlaceholderArray") originalSel:@selector(initWithObjects:count:) newSel:@selector(safe_initWithObjects:count:)];
        
        [self safe_exchangeInstanceMethod:objc_getClass("__NSArrayI") originalSel:@selector(objectAtIndex:) newSel:@selector(safe_objectAtIndexI:)];
        [self safe_exchangeInstanceMethod:objc_getClass("__NSArrayI") originalSel:@selector(objectAtIndexedSubscript:) newSel:@selector(safe_objectAtIndexedSubscriptI:)];

        [self safe_exchangeInstanceMethod:objc_getClass("__NSArray0") originalSel:@selector(objectAtIndex:) newSel:@selector(safe_objectAtIndex0:)];
        [self safe_exchangeInstanceMethod:objc_getClass("__NSSingleObjectArrayI") originalSel:@selector(objectAtIndex:) newSel:@selector(safe_objectAtIndexSI:)];
    });
}

-(instancetype)safe_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt
{

    id instance = nil;
    @try {
        instance = [self safe_initWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        HRCatchCrashLog(exception,HRSafeCatchCrashTypeNSArray);
        NSInteger newObjsIndex = 0;
        id   newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
            }else{
                newObjects[newObjsIndex] = @"";
            }
            newObjsIndex++;
        }
        instance = [self safe_initWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
    
}
-(id)safe_objectAtIndexedSubscriptI:(NSUInteger)index
{
    id object=nil;
    @try {
       object = [self safe_objectAtIndexedSubscriptI:index];
    }
    @catch (NSException *exception) {
        HRCatchCrashLog(exception,HRSafeCatchCrashTypeNSArray);
    }
    @finally {
        return object;
    }
}
-(id)safe_objectAtIndexI:(NSUInteger)index
{
    id object=nil;
    @try {
        object = [self safe_objectAtIndexI:index];
    }
    @catch (NSException *exception) {
        HRCatchCrashLog(exception,HRSafeCatchCrashTypeNSArray);
    }
    @finally {
        return object;
    }
}

-(id)safe_objectAtIndex0:(NSUInteger)index
{
    id object=nil;
    @try {
        object = [self safe_objectAtIndex0:index];
    }
    @catch (NSException *exception) {
        HRCatchCrashLog(exception,HRSafeCatchCrashTypeNSArray);
    }
    @finally {
        return object;
    }
}
-(id)safe_objectAtIndexSI:(NSUInteger)index
{
    id object=nil;
    @try {
        object = [self safe_objectAtIndexSI:index];
    }
    @catch (NSException *exception) {
        HRCatchCrashLog(exception,HRSafeCatchCrashTypeNSArray);
    }
    @finally {
        return object;
    }
}


@end



