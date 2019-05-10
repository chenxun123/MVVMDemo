//
//  CXCityListModel.h
//  reactivecocoaProjectDemo
//
//  Created by peter on 2019/5/9.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "CXBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 首页轮播图数据源
@interface CXCityBannerModel : NSObject

/**
 *  banner跳转地址
 */
@property (copy, nonatomic) NSString *html_url;
/**
 *  banner图地址
 */
@property (copy, nonatomic) NSString *image_url;

@end

#pragma mark - 首页列表用户信息数据源
@interface CXUserModel : NSObject

/**
 *  用户头像
 */
@property (copy, nonatomic) NSString *avatar_m;
/**
 *  用户名
 */
@property (copy, nonatomic) NSString *name;
/**
 *  用户id
 */
@property (strong, nonatomic) NSNumber *userID;

@end

#pragma mark - 首页列表数据源
@interface CXCityListModel : CXBaseModel

/**
 *  item背景
 */
@property (copy, nonatomic) NSString *cover_image;
/**
 *  游记标题
 */
@property (copy, nonatomic) NSString *name;
/**
 *  创建时间
 */
@property (copy, nonatomic) NSString *first_day;
/**
 *  游记地点
 */
@property (copy, nonatomic) NSString *popular_place_str;
/**
 *  游记天数
 */
@property (strong, nonatomic) NSNumber *day_count;
/**
 *  浏览人数
 */
@property (strong, nonatomic) NSNumber *view_count;
/**
 *  游记id
 */
@property (strong, nonatomic) NSNumber *travelID;
/**
 *  用户model
 */
@property (strong, nonatomic) CXUserModel *user;

@end

NS_ASSUME_NONNULL_END
