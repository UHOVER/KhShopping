//
//  UIWindow+KHSExtension.m
//  KhShopping
//
//  Created by 李小龙 on 2017/7/19.
//
//

#import "UIWindow+KHSExtension.h"

@implementation UIWindow (KHSExtension)

- (void)startShowNetworkLaunchimage {

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = self.bounds;
    imageView.backgroundColor = [UIColor blueColor];
    [self addSubview:imageView];

    [UIView animateWithDuration:6.0 animations:^{
        imageView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];

}


@end
