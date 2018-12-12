
#import "HRSafeComponent.h"

@implementation HRSafeComponent

+(void)openSafeProtectorWithIsDebug:(BOOL)isDebug isOpen:(BOOL)isOpenCrashSafe block:(HRSafeCatchBlock)block
{
    [NSObject openAllSafeProtectorWithIsDebug:isDebug isOpen:isOpenCrashSafe block:block];
}
    
@end
