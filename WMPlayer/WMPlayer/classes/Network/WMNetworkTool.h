//
//  WMNetworkTool.h
//  WMPlayer
//
//  Created by 王孟 on 2017/3/19.
//  Copyright © 2017年 王孟. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger, NetworkStates) {
    NetworkStatesNone, // 没有网络
    NetworkStates2G, // 2G
    NetworkStates3G, // 3G
    NetworkStates4G, // 4G
    NetworkStatesWIFI // WIFI
};

@interface WMNetworkTool : AFHTTPSessionManager

+ (instancetype)shareTool;

// 判断网络类型
+ (NetworkStates)getNetworkStates;


@end
