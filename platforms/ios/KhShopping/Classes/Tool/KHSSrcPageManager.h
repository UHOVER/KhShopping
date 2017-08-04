//
//  KHSSrcPageManager.h
//  KhShopping
//
//  Created by 李小龙 on 2017/7/12.
//
//

#import <Foundation/Foundation.h>


typedef void(^KHSSrcPageManagerNetworkBlock)();


@interface KHSSrcPageManager : NSObject


@property (nonatomic, copy) KHSSrcPageManagerNetworkBlock finishNetworkBlock;



+ (instancetype)share;

/**
 是否加载配置文件中的src地址

 @return <#return value description#>
 */
+ (BOOL)loadConfigureStartPage;



/**
 返回指定的网络地址

 @return 网络地址
 */
+ (NSString *)networkStartPage;


/**
 加载网络请求，请求是否加载网络地址
 */
+ (void)requestNetworkStartPage;


@end
