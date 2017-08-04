//
//  UIWebView+KHSExtension.m
//  KhShopping
//
//  Created by 李小龙 on 2017/6/29.
//
//

#import "UIWebView+KHSExtension.h"

@implementation UIWebView (KHSExtension)


+ (void)initialize {
    [self registerWebViewUserAgent];
}


+ (void)registerWebViewUserAgent {

    UIWebView *webView = [[[self class] alloc] init];
    NSString *oldAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSString *newAgent = [oldAgent stringByAppendingString:@" YD/zhe(0610)_iOS"];
    NSDictionary *dictionnary = [[NSDictionary alloc] initWithObjectsAndKeys:newAgent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionnary];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}



@end
