//
//  CXBaseViewController.m
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/4/28.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "CXBaseViewController.h"

@interface CXBaseViewController ()

@end

@implementation CXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithViewModel:(CXBaseViewModel *)viewModel{
    
    if (self = [super init]) {
        
        self.baseViewModel = viewModel;
    }
    
    return self;
}
- (void)bindViewModel{
    
    @weakify(self);
    
    [RACObserve(CX_APPDelegate, NetWorkStatus) subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x integerValue] == RealStatusUnknown || [x integerValue] == RealStatusNotReachable) {
            
            [self.baseViewModel.requestDataCommand execute:@(RealStatusNotReachable)];
        }else{
            
            [self.baseViewModel.requestDataCommand execute:@(1)];
        }
    }];
}

/**
 - (void)bindViewModel
 {
 @weakify(self);
 [RACObserve(HT_APPDelegate , NetWorkStatus) subscribeNext:^(NSNumber *networkStatus) {
 
 @strongify(self);
 if (networkStatus.integerValue == RealStatusNotReachable || networkStatus.integerValue == RealStatusUnknown) {
 
 [self.viewModel.requestDataCommand execute:@(RealStatusNotReachable)];
 }else{
 
 [self.viewModel.requestDataCommand execute:@1];
 }
 
 }];
 
 }
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
