//
//  ViewController.h
//  WaterMarkAndScreenShot
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 AnarL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *sourceImage;
@property (weak, nonatomic) IBOutlet UIImageView *waterMark;

@property (weak, nonatomic) IBOutlet UIImageView *imageWithWaterMark;
- (IBAction)addWaterMark:(UIButton *)sender;
- (IBAction)screenShot:(UIButton *)sender;

@end

