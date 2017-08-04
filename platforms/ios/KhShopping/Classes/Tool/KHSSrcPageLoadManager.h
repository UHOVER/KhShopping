//
//  KHSSrcPageLoadManager.h
//  KhShopping
//
//  Created by 李小龙 on 2017/7/12.
//
//

#import <Foundation/Foundation.h>

typedef void(^KHSSrcPageLoadManagerBlock)(NSDictionary *resultDict, NSError *error);

@interface KHSSrcPageLoadManager : NSObject

+ (void)loadSrcPageInfo:(KHSSrcPageLoadManagerBlock)block;

@end
