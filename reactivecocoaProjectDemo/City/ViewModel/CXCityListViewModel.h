//
//  CXCityListViewModel.h
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/5/9.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "CXBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXCityListViewModel : CXBaseViewModel

/*
 首页列表数据源
 */
@property (nonatomic, strong) NSArray * traveData;

/*
 首页轮播图数据源
 */
@property (nonatomic, strong) NSArray * bannerData;

@end

NS_ASSUME_NONNULL_END
