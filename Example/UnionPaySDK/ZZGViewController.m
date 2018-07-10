//
//  ZZGViewController.m
//  UnionPaySDK
//
//  Created by wanghuizhou21@163.com on 07/09/2018.
//  Copyright (c) 2018 wanghuizhou21@163.com. All rights reserved.
//

#import "ZZGViewController.h"
#import "UnPaySDK.h"




#define Mode_Development             @"01"
#define URL_TN_Normal                @"http://101.231.204.84:8091/sim/getacptn"


@interface ZZGViewController ()
@property (nonatomic, strong) NSString * stnNo;
@end

@implementation ZZGViewController

static dispatch_group_t history_group = nil;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 100, 250, 100);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"普通订单，mode=01" forState:0];
    [btn addTarget:self action:@selector(normalunPayClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(50, 300, 270, 100);
    btn2.backgroundColor = [UIColor grayColor];
    [btn2 setTitle:@"配置用户123456789,mode=01" forState:0];
    [btn2 addTarget:self action:@selector(unPayClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
}


- (void) normalunPayClick {
    NSURL *url = [NSURL URLWithString:URL_TN_Normal];
    NSURLSession *session = [NSURLSession sharedSession];
    __weak __typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString * stnNo = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [weakSelf payMenu:stnNo];
    }];
    [dataTask resume];
}


-(void)payMenu:(NSString *)stn {
    pay_dispatch_main_async_safe(^{
        [[UPPaymentControl defaultControl] startPay:stn fromScheme:@"ZZG" mode:Mode_Development viewController:self];
    });
}


- (void)unPayClick {
    
}


@end
