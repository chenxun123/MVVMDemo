//
//  CXCityListViewModel.m
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/5/9.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "CXCityListViewModel.h"

@implementation CXCityListViewModel

- (instancetype)initWithServices:(id<CXViewModelService>)service params:(NSDictionary *)params{
    
    if (self = [super initWithServices:service params:params]) {
        
        _bannerData = [NSArray new];
        _traveData  = [NSArray new];
    }
    
    return self;
}

- (void)initialize{
    
    [super initialize];
    
    
}

- (RACSignal *)executeRequestDataSignal:(id)input{
    
    if ([input integerValue] == RealStatusNotReachable) {
        
        return [RACSignal empty];
    }else{
        
        @weakify(self);
        return [[[[self.servieces getCityTravelService] requestCityTravelDataSignal:CityTravel_URL] doNext:^(NSDictionary *  _Nullable obj) {
            @strongify(self);
            self.traveData = [obj objectForKey:TravelDatakey];
            self.bannerData = [obj objectForKey:BannerDatakey];
            //            NSLog(@"viewModel = %@",x);
        }] doError:^(NSError * _Nonnull error) {
            
            NSLog(@"%@",error.description);
        }] ;
    }
}

@end
