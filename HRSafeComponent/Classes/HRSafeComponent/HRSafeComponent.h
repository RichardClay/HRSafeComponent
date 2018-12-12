//
//  HRSafeComponent
//

//  Created by lz on 2017/8/9.
//  Copyright © 2018年 lz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Safe.h"
@interface HRSafeComponent : NSObject
    
//打开目前所支持的所有安全保护 回调block
+ (void)openSafeProtectorWithIsDebug:(BOOL)isDebug isOpen:(BOOL)isOpenCrashSafe block:(HRSafeCatchBlock)block;
    
@end
