//
//  KHSSrcPageLoadManager.m
//  KhShopping
//
//  Created by 李小龙 on 2017/7/12.
//
//

#import "KHSSrcPageLoadManager.h"
#import "AFNetworking.h"


@implementation KHSSrcPageLoadManager


+ (void)loadSrcPageInfo:(KHSSrcPageLoadManagerBlock)block {

    if(block == nil) {
        return;
    }
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer.timeoutInterval = 10.0;
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSDictionary *param = @{@"version" : version};
    NSString *url = @"http://www.khshopping.com/techqijianban.php?m=Public&a=getReturnUrl";
    [sessionManager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"-----");
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        block(resultDict, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil, error);
    }];
}


@end
