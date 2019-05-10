//
//  CXViewModel.h
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/4/28.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXViewModelService.h"
NS_ASSUME_NONNULL_BEGIN

@interface CXBaseViewModel : NSObject

/*
 数据请求
 */
@property (nonatomic, strong, readonly) RACCommand * requestDataCommand;

/*
 网络状态
 */
@property (nonatomic, assign) ReachabilityStatus netWorkStatus;

/*
 viewModel服务
 */
@property (nonatomic, strong, readonly) id<CXViewModelService>servieces;


/*
 根据协议管理类创建vieMode
 */
- (instancetype)initWithServices:(id<CXViewModelService>)service params:(NSDictionary *)params;

/*
 控制requestDataCommand的执行
 */
- (RACSignal *)executeRequestDataSignal:(id)input;

- (void)initialize;
@end

NS_ASSUME_NONNULL_END
