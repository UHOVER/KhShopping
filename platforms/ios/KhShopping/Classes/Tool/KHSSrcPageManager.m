//
//  KHSSrcPageManager.m
//  KhShopping
//
//  Created by 李小龙 on 2017/7/12.
//
//

#import "KHSSrcPageManager.h"
#import "KHSSrcPageLoadManager.h"

@interface KHSSrcPageManager ()

@property (nonatomic, strong) NSDictionary *resultInfo;
@property (nonatomic, assign) BOOL isLoading;

@end



@implementation KHSSrcPageManager


+ (instancetype)share {
    static KHSSrcPageManager *share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[[self class] alloc] init];
    });
    return share;
}

- (instancetype)init {
    self = [super init];
    if(self) {
        _isLoading = YES;
    }
    return self;
}


+ (BOOL)loadConfigureStartPage {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [KHSSrcPageManager share].isLoading = NO;
            NSLog(@"6秒超时");
        });
    });
    while ([KHSSrcPageManager share].isLoading) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"循环中");
    }
    if([KHSSrcPageManager share].resultInfo) {
        NSString *status = [NSString stringWithFormat:@"%@", [[KHSSrcPageManager share].resultInfo objectForKey:@"status"] ];
        if([status isEqualToString:@"1"]) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES;
    }

}


+ (NSString *)networkStartPage {
    NSString *startPage = [[KHSSrcPageManager share].resultInfo objectForKey:@"url"];
    if(!startPage) {
        startPage = @"http://www.khshopping.com";
    }
    return startPage;
}



+ (void)requestNetworkStartPage {

    NSLog(@"开始下载");

    [KHSSrcPageManager share].isLoading = YES;
    [KHSSrcPageLoadManager loadSrcPageInfo:^(NSDictionary *resultDict, NSError *error) {
        NSLog(@"-------------下载完毕");
        [KHSSrcPageManager share].isLoading = NO;
        [KHSSrcPageManager share].resultInfo = resultDict;
        if([KHSSrcPageManager share].finishNetworkBlock) {
            [KHSSrcPageManager share].finishNetworkBlock();
        }
    }];


}


@end
