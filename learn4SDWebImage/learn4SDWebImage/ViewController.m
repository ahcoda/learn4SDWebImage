//
//  ViewController.m
//  learn4SDWebImage
//
//  Created by ruglcc on 2018/10/12.
//  Copyright © 2018 ruglcc. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define KEY_INFO @"key_user_data"

@interface ViewController ()<NSCacheDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic, strong) NSCache *cache;

@end

@implementation ViewController

- (NSCache *)cache
{
    if(_cache == nil)
    {
        _cache = [[NSCache alloc]init];
    }
    
    return _cache;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadImageView];
    [self setupData];
}


-(void)setupData {
    
    self.cache.delegate = self;
}

- (void)loadImageView {

    NSString *strUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539773685640&di=9e9b33748101297d99aa8106bb21b608&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F730e0cf3d7ca7bcb944f655cb3096b63f624a889.jpg";
    NSURL * url = [NSURL URLWithString:strUrl];
    [self.imageView sd_setImageWithURL:url];
}

/**
 写数据按钮响应

 @param sender btn
 */
- (IBAction)onClickWriteButton:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"I am AhCoda" forKey:KEY_INFO];
}

- (IBAction)onClickWriteCacheBtn:(id)sender {
    
   // [self.cache setObject:@"cacheValue" forKey:@"key_cache"];
    
    
    for(int i = 0;i < 100000;i++){
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Packaging" ofType:@"log"]];
        
        // 1.缓存数据
        [self.cache setObject:data forKey:[NSString stringWithFormat:@"image_%d",arc4random()]];
    }
    
  
}
- (IBAction)onClickReadCacheBtn:(id)sender {
    
   NSData *data= [self.cache valueForKey:@"key_cache"];

    NSLog(@"cacheValue = %@", data);
}


#pragma mark - NSCacheDelegate
- (void)cache:(NSCache *)cache willEvictObject:(id)obj{
    NSLog(@"删除缓存数据");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"内存警告");
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
