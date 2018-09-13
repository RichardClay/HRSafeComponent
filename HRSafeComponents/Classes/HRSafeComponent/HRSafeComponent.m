
#import "HRSafeComponent.h"

@implementation HRSafeComponent

+(void)openSafeProtectorWithIsDebug:(BOOL)isDebug block:(HRSafeCatchBlock)block
{
    [NSObject openAllSafeProtectorWithIsDebug:isDebug block:block];
}
    
@end
