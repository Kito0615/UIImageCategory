//
//  ViewController.m
//  WaterMarkAndScreenShot
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 AnarL. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+AnarLWaterMark.h"
#import "UIImage+AnarLScreenShot.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController * _sourcePickerController;
    UIImagePickerController * _waterPickerController;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer * tapGR1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    
    [self.sourceImage addGestureRecognizer:tapGR1];
    UITapGestureRecognizer * tapGR2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    [self.waterMark addGestureRecognizer:tapGR2];
    
    self.sourceImage.userInteractionEnabled = YES;
    self.waterMark.userInteractionEnabled = YES;
    
}

- (void)tapImage:(UITapGestureRecognizer *)tapGR
{
    if (tapGR.view == _sourceImage) {
        _sourcePickerController = [[UIImagePickerController alloc] init];
        _sourcePickerController.delegate = self;
        _sourcePickerController.allowsEditing = YES;
        
        [self presentViewController:_sourcePickerController animated:YES completion:^{
            
        }];
    } else {
        _waterPickerController = [[UIImagePickerController alloc] init];
        _waterPickerController.delegate = self;
        _waterPickerController.allowsEditing = YES;
        [self presentViewController:_waterPickerController animated:YES completion:^{
            
        }];
    }
}
#pragma mark -UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (picker == _sourcePickerController) {
        self.sourceImage.image = image;
        
    } else if(picker == _waterPickerController) {
        self.waterMark.image = image;
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)addWaterMark:(UIButton *)sender {
    
    CGFloat waterMarkX = self.sourceImage.image.size.width - 100;
    CGFloat waterMarkY = self.sourceImage.image.size.height - 100;
    
    CGFloat waterMarkW = 95;
    CGFloat waterMarkH = 95;
    
    NSLog(@"%@", NSStringFromCGRect(CGRectMake(waterMarkX, waterMarkY, waterMarkW, waterMarkH)));
    
    self.imageWithWaterMark.image = [UIImage setWaterMark:self.waterMark.image AtBackgroundImage:self.sourceImage.image atPosition:CGPointMake(waterMarkX, waterMarkY) withDesignedSize:CGSizeMake(waterMarkW, waterMarkH)];
    
}

- (IBAction)screenShot:(UIButton *)sender {
    
    [self performSelectorInBackground:@selector(saveScreenShot) withObject:nil];
    
}

- (void)saveScreenShot
{
    UIImage * screenShot = [UIImage screenShotView:self.view];
    
    UIImageWriteToSavedPhotosAlbum(screenShot, nil, nil, nil);
    
    [[[UIAlertView alloc] initWithTitle:@"提示" message:@"截图成功，请到相册查看" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}


@end
