//
//  CXBaseViewController.h
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/4/28.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CXBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CXBaseViewController : UIViewController

@property (nonatomic, strong) CXBaseViewModel * baseViewModel;

- (instancetype)initWithViewModel:(CXBaseViewModel *)viewModel;
- (void)bindViewModel;

@end

NS_ASSUME_NONNULL_END
