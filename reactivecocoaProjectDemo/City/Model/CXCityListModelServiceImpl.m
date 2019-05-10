//
//  CXCityListModelServiceImpl.m
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/5/9.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "CXCityListModelServiceImpl.h"

@interface CXCityListModelServiceImpl ()
/*
 轮播图数据源
 */
@property (nonatomic, strong) NSMutableArray * bannerData;
/*
 列表数据源
 */
@property (nonatomic, strong) NSMutableArray * itemsData;
/*
 首页整体的model数据源
 */
@property (nonatomic, strong) NSMutableDictionary * traveData;
/*
 上拉加载更多的索引
 */
@property (nonatomic, copy)   NSString * next_start;
@end

@implementation CXCityListModelServiceImpl

- (RACSignal *)requestCityTravelDataSignal:(NSString *)requestUrl{
    
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        HTURLSessionTask *task = [HTNetWorking getWithUrl:requestUrl refreshCache:YES showHUD:@"loading..." success:^(id response) {
            
            /**
             NSDictionary *responseDic = response;
             NSArray *responseArr = responseDic[@"data"][@"elements"];
             //            NSArray *searchArr = responseDic[@"data"][@"search_data"];
             self.next_start = [NSString stringWithFormat:@"%@",response[@"data"][@"next_start"]];
             
             [responseArr enumerateObjectsUsingBlock:^(NSDictionary *data, NSUInteger idx, BOOL * _Nonnull stop) {
             if ([data[@"type"] integerValue] == 1) {// 广告数据
             
             [data[@"data"][0] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
             HTBannerModel *bannerModel = [HTBannerModel mj_objectWithKeyValues:obj];
             [self.bannerData addObject:bannerModel];
             }];
             
             }else if ([data[@"type"] integerValue] == 4){// item数据
             
             [data[@"data"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
             HTCityTravelItemModel *bannerModel = [HTCityTravelItemModel mj_objectWithKeyValues:obj];
             [self.itemData addObject:bannerModel];
             }];
             }
             }];
             */
            
            NSDictionary *responseDic = response;
            NSArray * responseArr = responseDic[@"data"][@"elements"];
            self.next_start = [NSString stringWithFormat:@"%@",response[@"data"][@"next_start"]];
            
            [responseArr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if ([obj[@"type"] integerValue] == 1) {//广告轮播图数据
                    
                    [obj[@"data"][0] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        
                        CXCityBannerModel * model = [CXCityBannerModel mj_objectWithKeyValues:obj];
                        [self.bannerData addObject:model];
                    }];
                    
                    
                }else if ([obj[@"type"] integerValue] == 4){
                    
                    [obj[@"data"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        
                        CXCityListModel * model = [CXCityListModel mj_objectWithKeyValues:obj];
                        [self.itemsData addObject:model];
                    }];
                }
            }];
            
            [self.traveData setObject:self.bannerData forKey:BannerDatakey];
            [self.traveData setObject:self.itemsData forKey:TravelDatakey];
            
            [subscriber sendNext:self.traveData];
            [subscriber sendCompleted];
        } fail:^(NSError *error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
            [task cancel];
        }];
    }];
}

- (RACSignal *)requestCityTravelMoreDataSignal:(NSString *)requestUrl{
    
    return [RACSignal empty];
}


- (NSMutableArray *)bannerData{
    
    return HT_LAZY(_bannerData, @[].mutableCopy);
}

- (NSMutableArray *)itemsData{
    
    return HT_LAZY(_itemsData, @[].mutableCopy);
}

- (NSMutableDictionary *)traveData{
    
    return HT_LAZY(_traveData, @{}.mutableCopy);
}
@end
