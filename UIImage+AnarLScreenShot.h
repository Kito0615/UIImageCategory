//
//  UIImage+AnarLScreenShot.h
//  WaterMark
//
//  Created by qianfeng on 15/9/5.
//  Copyright (c) 2015年 AnarL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (AnarLScreenShot)

/**
 *  截取view
 *
 *  @param view 要截取的view
 *
 *  @return 返回一张图片
 */
+(instancetype)screenShotView:(UIView *)view;

@end
