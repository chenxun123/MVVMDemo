//
//  CXViewModelServicesImpl.m
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/5/9.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "CXViewModelServicesImpl.h"
#import "CXCityListModelServiceImpl.h"
@interface CXViewModelServicesImpl ()

/*首页数据服务*/
@property (nonatomic, strong) CXCityListModelServiceImpl * cityListServices;

@end

@implementation CXViewModelServicesImpl

- (instancetype)initModelServicesImpl{
    
    if (self = [super init]) {
        
        self.cityListServices = [[CXCityListModelServiceImpl alloc]init];
    }
    
    return self;
}
- (id<CXViewModelProtocolImpl>)getCityTravelDetailService {
    
    return nil;
}

- (id<CXViewModelProtocolImpl>)getCityTravelService {
    
    return self.cityListServices;
}

@end
