//
//  CXViewModelService.h
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/5/8.
//  Copyright © 2019年 peter. All rights reserved.
// 此文件包含所有的服务类返回方法

#import <Foundation/Foundation.h>
#import "CXViewModelProtocolImpl.h"

@protocol CXViewModelService <NSObject>

//获取首页服务
- (id<CXViewModelProtocolImpl>)getCityTravelService;

//获取首页详情服务
- (id<CXViewModelProtocolImpl>)getCityTravelDetailService;

@end

