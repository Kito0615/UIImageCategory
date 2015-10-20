//
//  UIImage+AnarLScreenShot.m
//  WaterMark
//
//  Created by qianfeng on 15/9/5.
//  Copyright (c) 2015年 AnarL. All rights reserved.
//

#import "UIImage+AnarLScreenShot.h"

@implementation UIImage (AnarLScreenShot)

+(instancetype)screenShotView:(UIView *)view
{
    // 1. 开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    // 2. 将view的图层渲染到上下文中
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3. 取得新的图片
    UIImage * screenShot = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4. 返回截取的图片
    return screenShot;
}

@end
