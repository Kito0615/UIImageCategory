//
//  UIImage+AnarLWaterMark.h
//  WaterMark
//
//  Created by qianfeng on 15/9/5.
//  Copyright (c) 2015年 AnarL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (AnarLWaterMark)

/**
 *  @brief 生成一张带有水印的图片(水印图片缩放比例0.5,距左边5px,距底部5px)
 *
 *  @param bgImageName        背景图片名称，也是主要图片
 *  @param waterMarkImageName 水印图片名称
 *
 */
+(instancetype)waterMarkWithBgImageName:(NSString *)bgImageName andWaterMarkImageName:(NSString *)waterMarkImageName;

/**
 *  @brief 生成一张带有水印的图片(水印图片缩放比例0.5,距左边5px,距底部5px)
 *
 *  @param backgroundImage 背景图片
 *  @param waterMarkImage  水印图片
 *
 *  @return 带水印的图片
 */
+(instancetype)waterMarkWithBackgroundImage:(UIImage *)backgroundImage waterMarkImage:(UIImage *)waterMarkImage;


/**
 *  @brief 在背景图片的指定位置生成指定大小的水印
 *
 *  @param waterMark       水印图片
 *  @param backgroundImage 背景图片（主图片）
 *  @param position        水印位置
 *  @param waterMarkSize   水印大小
 *
 *  @return 带水印的图片
 */
+(instancetype)setWaterMark:(UIImage *)waterMark AtBackgroundImage:(UIImage *)backgroundImage atPosition:(CGPoint)position withDesignedSize:(CGSize)waterMarkSize;
/**
 *  @brief 在背景图片的指定位置生成指定大小的水印
 *
 *  @param waterMarkName       水印图片名称
 *  @param backgroundImageName 背景图片名称
 *  @param position            水印位置
 *  @param waterMarkSize       水印大小
 *
 *  @return 带水印的图片
 */
+(instancetype)setWaterMarkWithName:(NSString *)waterMarkName AtBackgroundImageWithName:(NSString *)backgroundImageName atPosition:(CGPoint)position withDesignedSize:(CGSize)waterMarkSize;


@end
