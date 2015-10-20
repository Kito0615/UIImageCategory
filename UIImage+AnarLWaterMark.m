//
//  UIImage+AnarLWaterMark.m
//  WaterMark
//
//  Created by qianfeng on 15/9/5.
//  Copyright (c) 2015年 AnarL. All rights reserved.
//

#import "UIImage+AnarLWaterMark.h"

@implementation UIImage (AnarLWaterMark)

+(instancetype)waterMarkWithBgImageName:(NSString *)bgImageName andWaterMarkImageName:(NSString *)waterMarkImageName
{
    // 1. 取得背景图片
    UIImage * bgImage = [UIImage imageNamed:bgImageName];
    
    // 2. 利用背景图片的大小确定图形上下文的大小
    UIGraphicsBeginImageContextWithOptions(bgImage.size, YES, 0.0);
    
    // 3. 绘制背景图片
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 3. 取得水印图片
    UIImage * waterMarkImage = [UIImage imageNamed:waterMarkImageName];
    
    // 4. 设置水印的位置
    CGFloat scale = 0.5;
    CGFloat margin = 5;
    CGFloat waterMarkWidth = waterMarkImage.size.width * scale;
    CGFloat waterMarkHeight = waterMarkImage.size.height * scale;
    CGFloat waterMarkX = bgImage.size.width - waterMarkWidth - margin;
    CGFloat waterMarkY = bgImage.size.height - waterMarkHeight - margin;
    
    // 5. 绘制水印
    [waterMarkImage drawInRect:CGRectMake(waterMarkX, waterMarkY, waterMarkWidth, waterMarkHeight)];
    
    // 6. 取得制作完成的UIImage对象
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 7. 结束上下文
    UIGraphicsEndImageContext();
    
    // 8. 返回新生成带水印的图片
    return newImage;
}


+(instancetype)waterMarkWithBackgroundImage:(UIImage *)backgroundImage waterMarkImage:(UIImage *)waterMarkImage
{
    UIGraphicsBeginImageContextWithOptions(backgroundImage.size, YES, 0.0);
    
    [backgroundImage drawInRect:CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height)];
    
    CGFloat scale = 0.5;
    CGFloat margin = 5;
    CGFloat waterMarkWidth = waterMarkImage.size.width * scale;
    CGFloat waterMarkHeight = waterMarkImage.size.width * scale;
    
    CGFloat waterMarkX = backgroundImage.size.width - waterMarkWidth - margin;
    CGFloat waterMarkY = backgroundImage.size.height - waterMarkHeight - margin;
    
    [waterMarkImage drawInRect:CGRectMake(waterMarkX, waterMarkY, waterMarkWidth, waterMarkHeight)];
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

+(instancetype)setWaterMark:(UIImage *)waterMark AtBackgroundImage:(UIImage *)backgroundImage atPosition:(CGPoint)position withDesignedSize:(CGSize)waterMarkSize
{
    UIGraphicsBeginImageContextWithOptions(backgroundImage.size, YES, 0.0);
    
    NSLog(@"%@", NSStringFromCGSize(backgroundImage.size));
    
    [backgroundImage drawInRect:CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height)];
    
    [waterMark drawInRect:CGRectMake(position.x, position.y, waterMarkSize.width, waterMarkSize.height)];
    
    NSLog(@"%@", NSStringFromCGRect(CGRectMake(position.x, position.y, waterMarkSize.width, waterMarkSize.height)));
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(instancetype)setWaterMarkWithName:(NSString *)waterMarkName AtBackgroundImageWithName:(NSString *)backgroundImageName atPosition:(CGPoint)position withDesignedSize:(CGSize)waterMarkSize
{
    UIImage * backgroundImage = [UIImage imageNamed:backgroundImageName];
    
    UIImage * waterMark = [UIImage imageNamed:waterMarkName];
    
    return [self setWaterMark:waterMark AtBackgroundImage:backgroundImage atPosition:position withDesignedSize:waterMarkSize];
}


@end
