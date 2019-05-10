//
//  HTTPManger.h
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/4/28.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTTPManger : NSObject

+ (RACSignal *)requestCityTravelDataSignal:(NSString *)requestUrl;

@end

NS_ASSUME_NONNULL_END
