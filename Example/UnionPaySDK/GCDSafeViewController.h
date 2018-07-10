//
//  GCDSafeViewController.h
//  AFNetworking
//
//  Created by zzg on 2018/7/10.
//

#import <UIKit/UIKit.h>


//#define pay_dispatch_main_sync_safe(block)\
//if ([NSThread isMainThread]) {\
//block();\
//} else {\
//dispatch_sync(dispatch_get_main_queue(), block);\
//}
//
//#define pay_dispatch_main_async_safe(block)\
//if ([NSThread isMainThread]) {\
//block();\
//} else {\
//dispatch_async(dispatch_get_main_queue(), block);\
//}
//
//#ifndef pay_dispatch_main_async_safe
//#define pay_dispatch_main_async_safe(block)\
//if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
//block();\
//} else {\
//dispatch_async(dispatch_get_main_queue(), block);\
//}
//#endif

