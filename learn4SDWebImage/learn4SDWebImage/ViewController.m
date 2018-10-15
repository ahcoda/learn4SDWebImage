//
//  ViewController.m
//  learn4SDWebImage
//
//  Created by ruglcc on 2018/10/12.
//  Copyright © 2018 ruglcc. All rights reserved.
//

#import "ViewController.h"

#define KEY_INFO @"key_user_data"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}


/**
 写数据按钮响应

 @param sender btn
 */
- (IBAction)onClickWriteButton:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"I am AhCoda" forKey:KEY_INFO];
}


/**
 写数据按钮响应

 @param sender btn
 */
- (IBAction)onClickReadButton:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString * string = [ud stringForKey:KEY_INFO];
    
    NSLog(@"%@", string);
}


/**
 点击按钮1，获取沙盒路径

 @param sender 按钮
 */
- (IBAction)onClickSandBoxButton:(id)sender {
    
    // 1. 获取沙盒根目录路径
    NSString *homeDir = NSHomeDirectory();
    
    NSLog(@"沙盒根目录路径 = %@", homeDir);
    
    // 2. 获取Documents目录路径
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    
     NSLog(@"Documents目录路径 = %@", docDir);
    
    //2. 获取Library的目录路径
    NSString *libDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) lastObject];
    
    NSLog(@"Library目录路径 = %@", libDir);
    
    // 3. 获取cache目录路径
    NSString *cachesDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject];
    
     NSLog(@"cachesDir目录路径 = %@", cachesDir);
   
    // 4. 获取tmp目录路径
    NSString *tmpDir =NSTemporaryDirectory();
    
    NSLog(@"tmpDir目录路径 = %@", tmpDir);

    // 5. 获取应用程序程序包中资源文件路径的方法：
    NSString *bundle = [[NSBundle mainBundle] bundlePath];
    NSLog(@"程序程序包中资源文件目录路径 = %@", bundle);
 
}

@end
