//
//  LZMDataAnalysis.m
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/3/18.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import "LZMDataAnalysis.h"
#import "UMAnalytics/MobClick.h"

NSString *const kTestEvent = @"lzm_test_event";

NSString *const kUniversalEvent  = @"view";
NSString *const kUserIdentifer   = @"userId";

#pragma mark -
NSString *const kAnyAppStartTime         = @"app_start_time";
// 广告
NSString *const kAnyHomePageBanner    =   @"app_index_slide_ad" ; // APP首页轮播广告点击
NSString *const kAnyCanteenHomePageBanner     =   @"food_index_slide_ad" ; //  美食首页轮播广告点击
NSString *const kAnyShopMallBanner    =   @"mall_index_slide_ad" ; // 商城首页轮播广告点击
// 工具
NSString *const kAnyDoorLock             =   @"access_entrance" ; // 门禁点击
NSString *const kAnyWifi                 =   @"surfing_entrance" ; //  上网点击
NSString *const kAnyParking              =   @"parking_entrance" ; // 停车缴费点击
NSString *const kAnyPropertyService      =   @"property_service_entrance" ; // 物业服务点击
// 电商（美食&商城）
NSString *const kAnyCanteenEntrance      =   @"food_index_group" ; // 美食首页分组点击
NSString *const kAnyShopMallEntrance     =   @"mall_index_group" ; //  商城首页分组点击
NSString *const kAnyShopList             =   @"shop_goods_list" ;  // 浏览店铺点击
NSString *const kAnyShopMallShopList     =   @"mall_goods_list"  ;   // 商城店铺首页
NSString *const kAnyShopMallGoodsDetail  =   @"mall_goods_detail" ; //  美食商品详情点击
NSString *const kAnyCanteenGoodsDetail   =   @"shop_goods_detail" ; //  优品商品详情点击
NSString *const kAnyShopTime             =   @"shop_view_time"; // 店铺停留时间
NSString *const kAnyProductDetailTime    =   @"product_detail_time"; // 商品详情停留时间

// 入口 v2
NSString *const kAnyExpressEntrance        =   @"express_entrance" ; //快递点击
NSString *const kAnyMeetingRoomEntrance    =   @"meeting_room_entrance" ;    // 会议室点击
NSString *const kAnyFoodEntrance           =   @"food_entrance" ; //美食
NSString *const kAnyJDEntrance             =   @"jdg_entrance" ; // 京东购
NSString *const kAnyShopService            =   @"administration_service_entrance" ;   // 解忧杂货铺

// 服务 v2
NSString *const kAnyUnoinEntrance          =   @"b_service_list" ;   // 企业联盟
// 我的
NSString *const kAnyMyCompanyVerify        =   @"company_verification_funtion" ;   // 我的认证
NSString *const kAnyMyselfVerify           =   @"id_card_verification_funtion" ;   // 我的身份认证
NSString *const kAnyContactor              =   @"address_book_funtion" ;   //  通讯录

// 发现
NSString *const kAnyDiscoveryList          =   @"discovery_info_list"; // 资讯列表
NSString *const kAnyDiscoveryDetail        =   @"discovery_info_detail";
NSString *const kAnyActivityList           =   @"discovery_activity_list"; // 活动列表
NSString *const kAnyActivityDetail         =   @"discovery_activity_detail"; //活动详情
// 门禁广告
NSString *const kAnyQRCodeBanner            = @"access_index_ad"  ;
// 二维码时长
NSString *const kAnyQRGenerateTime          = @"qr_code_generation_time";
NSString *const kAnyQRReGenerateTime        = @"qr_code_regeneration_time";

@implementation LZMDataAnalysis
static CFTimeInterval startTimer = 0;
#pragma mark - 页面统计
+ (void)beginLogPageView:(NSString *)identifer{
    [MobClick beginLogPageView:identifer];
}

+ (void)endLogPageView:(NSString *)identifer{
    [MobClick endLogPageView:identifer];
}

+ (void)pageEvent:(NSString *)event{
    [MobClick event:event label:nil];
}

#pragma mark - 事件统计
+ (void)actionEvent:(NSString *)event eventId:( NSString * _Nonnull )eventId{
    if (UserConfigManage.userId.length == 0 || !eventId){
        return ;
    }
    [MobClick event:event attributes:@{kUniversalEvent: eventId,
                                       kUserIdentifer : UserConfigManage.userId
                                       }];
}

#pragma mark - 时长统计
+ (void)timeBeginEvent:(NSString *)event{
    startTimer = CACurrentMediaTime();
}
+ (void)timeEndEvent:(NSString *)event{
    CFTimeInterval endTimer = CACurrentMediaTime();
    NSLog(@"时间间隔: %f ms", (endTimer-startTimer)*1000);
    [MobClick event:event attributes:nil durations:(endTimer-startTimer)*1000];
}
+ (void)timeEvent:(NSString *)event eventId:(NSString *)eventId seconds:(int)millseconds{
    if (UserConfigManage.userId.length == 0 || !eventId){
        return ;
    }
    NSDictionary *atts = nil;
    atts = @{eventId : @(millseconds).stringValue,
             kUserIdentifer : UserConfigManage.userId
             };
    [MobClick event:event attributes:atts counter:millseconds];
}


@end
