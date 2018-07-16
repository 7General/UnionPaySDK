//
//  ZZGAppDelegate.m
//  UnionPaySDK
//
//  Created by wanghuizhou21@163.com on 07/09/2018.
//  Copyright (c) 2018 wanghuizhou21@163.com. All rights reserved.
//

#import "ZZGAppDelegate.h"
#import <UnPaySDK.h>

@implementation ZZGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    /*
     url.host:uppayresult
     ZZG://uppayresult?code=success&data=%7B++%22sign%22+%3A+%22FUUDLw%2BvzvKWiZ4GTEjGnlFnh3mZ0OO2ulNvQgBf%2Bmie4PZ8pNnHXoVL5c97QDwVbbhlCLLA7Z61htg63HftQlkZzzXZYI9inKp0ZJ12YQyJro39hudxIyy9Qm%2Fs%2BqCZMiwd30%2FQ%2F3NPONoEGaaZd4LFYf4vo7ShqD%2FUg829conbux0lTH4H1EE3kPz%2FHjPTzw8skQW5AlEtHHSOeA0FIXZrht%2FYJ49cOJVOtdRKo4qVTlHA48CxZTIjp9Zt%2BWVEGEtNkzGA4R%2F5Mdu8oak%2FaQlM8nPNkfmPM3HH%2BSh3J074jefsUC49hI6VX92IP%2FEAaR9gq%2FjgT9w3sNDO8G9Z%2BA%3D%3D%22%2C++%22data%22+%3A+%22pay_result%3Dfail%26tn%3D505622694018222474600%26cert_id%3D69026276696%22%7D
     */
    [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
        if ([code isEqualToString:@"success"]) {
            if (nil == data) {
                return;
            }
            NSData * singData = [NSJSONSerialization dataWithJSONObject:data options:0 error:nil];
            NSString * sign = [[NSString alloc] initWithData:singData encoding:NSUTF8StringEncoding];
            // 拿该证书去商户后台验签
            if (YES/*验签sign*/) {
                NSLog(@"//验签成功，展示支付成功提示");
            }else {
                NSLog(@"验签失败，交易可能被串改，商户app后台查询结果");
            }
        }else if([code isEqualToString:@"fail"]){
            NSLog(@"交易失败");
        }else if([code isEqualToString:@"cancle"]){
            NSLog(@"交易取消");
        }
    }];
    
    return YES;
}

@end
