//
//  WMHomeBaseViewController.m
//  WMPlayer
//
//  Created by 王孟 on 2017/3/19.
//  Copyright © 2017年 王孟. All rights reserved.
//

#import "WMHomeBaseViewController.h"
#import "WMLiverModel.h"
#import "WMLiveViewController.h"

@interface WMHomeBaseViewController () <UITableViewDelegate, UITableViewDataSource>
/** 当前页 */
@property(nonatomic, assign) NSUInteger currentPage;
/** 直播 */
@property(nonatomic, strong) NSMutableArray *lives;
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation WMHomeBaseViewController

- (NSMutableArray *)lives
{
    if (!_lives) {
        _lives = [NSMutableArray array];
    }
    return _lives;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
    [self getHotLiveList];
    
}

- (void)setup {
    
    self.currentPage = 1;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WMScreenWidth, WMScreenHeight -49) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)getHotLiveList
{
    
    [[WMNetworkTool shareTool] GET:[NSString stringWithFormat:@"http://live.9158.com/Fans/GetHotLive?page=%ld", self.currentPage] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *result = [WMLiverModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        if (result.count) {
            [self.lives addObjectsFromArray:result];
            
            [self.tableView reloadData];
        }else{
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"网络异常");
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.lives.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    WMLiverModel *model = self.lives[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.bigpic]];
    cell.textLabel.text = model.myname;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WMLiverModel *model = self.lives[indexPath.row];
    WMLiveViewController *liveVC = [[WMLiveViewController alloc] init];
    liveVC.liveModel = model;
    [self.navigationController pushViewController:liveVC animated:YES];
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
