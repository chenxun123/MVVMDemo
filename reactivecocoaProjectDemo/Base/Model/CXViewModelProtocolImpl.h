//
//  CXViewModelProtocolImpl.h
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/5/7.
//  Copyright © 2019年 peter. All rights reserved.
//此文件包含所有的接口请求方法，每一个子类model文件夹，都会创建一个请求方法管理类，来遵循此协议，并实现相应的请求方法。

#import <Foundation/Foundation.h>
@protocol CXViewModelProtocolImpl <NSObject>

@optional
//加载首页数据
- (RACSignal *)requestCityTravelDataSignal:(NSString *)requestUrl;

//加载首页更多数据
- (RACSignal *)requestCityTravelMoreDataSignal:(NSString *)requestUrl;

//加载首页详情数据
- (RACSignal *)requestCityTravelDetailDataSignal:(NSString *)requestUrl;

@end

