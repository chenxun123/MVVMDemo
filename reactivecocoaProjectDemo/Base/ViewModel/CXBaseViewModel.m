//
//  CXViewModel.m
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/4/28.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "CXBaseViewModel.h"

@interface CXBaseViewModel ()

/*
 数据请求
 */
@property (nonatomic, strong, readwrite) RACCommand * requestDataCommand;

/*
 viewModel服务
 */
@property (nonatomic, strong, readwrite) id<CXViewModelService>servieces;

@end

@implementation CXBaseViewModel


/*
 根据协议管理类创建vieMode
 */
- (instancetype)initWithServices:(id<CXViewModelService>)service params:(NSDictionary *)params{
    
    if (self = [super init]) {
        
        self.servieces = service;
        
        @weakify(self);
        self.requestDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            NSLog(@"123121");
            return [[self executeRequestDataSignal:input] takeUntil:self.rac_willDeallocSignal];
        }];
        
        [self initialize];
    }
    
    
    return self;
}

- (void)initialize{
    
}
/*
 控制requestDataCommand的执行
 */
- (RACSignal *)executeRequestDataSignal:(id)input{
    
    return [RACSignal empty];
}
@end
