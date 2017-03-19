//
//  WMLiveViewController.m
//  WMPlayer
//
//  Created by 王孟 on 2017/3/19.
//  Copyright © 2017年 王孟. All rights reserved.
//

#import "WMLiveViewController.h"
#import "WMLiverModel.h"

@interface WMLiveViewController ()

@property (nonatomic, strong)IJKFFMoviePlayerController *player;

@end

@implementation WMLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
    
}

- (void)setup {
    
    self.title = self.liveModel.myname;
    
    // 创建IJKFFMoviePlayerController：专门用来直播，传入拉流地址就好了
    NSURL *url = [NSURL URLWithString:self.liveModel.flv];
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    
    // 准备播放
    [playerVc prepareToPlay];
    
    // 强引用，反正被销毁
    _player = playerVc;

    playerVc.view.frame = [UIScreen mainScreen].bounds;
    //    [self ]
    [self.view insertSubview:playerVc.view atIndex:1];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_player stop];
    self.tabBarController.tabBar.hidden = YES;
    
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
