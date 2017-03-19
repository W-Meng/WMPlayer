//
//  WMMainViewController.m
//  WMPlayer
//
//  Created by 王孟 on 2017/3/19.
//  Copyright © 2017年 王孟. All rights reserved.
//

#import "WMMainViewController.h"
#import "WMHomeBaseViewController.h"
#import "WMShowViewController.h"

@interface WMMainViewController ()

@end

@implementation WMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
    
}

- (void)setup {
    
    [self addChildViewController:[[WMHomeBaseViewController alloc] init] titleName:@"主页"];
    [self addChildViewController:[[WMShowViewController alloc] init]  titleName:@"直播"];
    
}

- (void)addChildViewController:(UIViewController *)childController titleName:(NSString *)titleName{
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    childController.title = titleName;
    childController.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:nav];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
