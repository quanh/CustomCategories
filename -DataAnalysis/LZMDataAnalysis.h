//
//  LZMDataAnalysis.h
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/3/18.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import <Foundation/Foundation.h>


UIKIT_EXTERN NSString *const kTestEvent;

UIKIT_EXTERN NSString *const kUniversalEvent    ;
UIKIT_EXTERN NSString *const kUserIdentifer ;

#pragma mark -
UIKIT_EXTERN NSString *const kAnyAppStartTime ; //app 启动时长
// 广告
UIKIT_EXTERN NSString *const kAnyHomePageBanner   ; // APP首页轮播广告点击
UIKIT_EXTERN NSString *const kAnyCanteenHomePageBanner     ; //  美食首页轮播广告点击
UIKIT_EXTERN NSString *const kAnyShopMallBanner   ; // 商城首页轮播广告点击
// 工具
UIKIT_EXTERN NSString *const kAnyDoorLock          ; // 门禁点击
UIKIT_EXTERN NSString *const kAnyWifi               ; //  上网点击
UIKIT_EXTERN NSString *const kAnyParking           ; // 停车缴费点击
UIKIT_EXTERN NSString *const kAnyPropertyService   ; // 物业服务点击
// 电商（美食&商城）
UIKIT_EXTERN NSString *const kAnyCanteenEntrance      ; // 美食首页分组点击
UIKIT_EXTERN NSString *const kAnyShopMallEntrance     ; //  商城首页分组点击
UIKIT_EXTERN NSString *const kAnyShopList              ;  // 浏览店铺点击
UIKIT_EXTERN NSString *const kAnyShopMallShopList ;
UIKIT_EXTERN NSString *const kAnyShopMallGoodsDetail  ; //  美食商品详情点击
UIKIT_EXTERN NSString *const kAnyCanteenGoodsDetail   ; //  优品商品详情点击
UIKIT_EXTERN NSString *const kAnyShopTime             ; // 店铺停留时间
UIKIT_EXTERN NSString *const kAnyProductDetailTime    ; // 商品详情停留时间

// 入口 v2
UIKIT_EXTERN NSString *const kAnyExpressEntrance        ; //快递点击
UIKIT_EXTERN NSString *const kAnyMeetingRoomEntrance    ; // 会议室点击
UIKIT_EXTERN NSString *const kAnyFoodEntrance           ; //美食
UIKIT_EXTERN NSString *const kAnyJDEntrance             ;// 京东购
UIKIT_EXTERN NSString *const kAnyShopService            ;// 解忧杂货铺

// 服务 v2
UIKIT_EXTERN NSString *const kAnyUnoinEntrance         ;// 企业联盟
// 我的
UIKIT_EXTERN NSString *const kAnyMyCompanyVerify       ;  // 我的认证
UIKIT_EXTERN NSString *const kAnyMyselfVerify           ;// 我的身份认证
UIKIT_EXTERN NSString *const kAnyContactor             ; //  通讯录

// 发现
UIKIT_EXTERN NSString *const kAnyDiscoveryList      ; // 资讯列表
UIKIT_EXTERN NSString *const kAnyDiscoveryDetail    ;
UIKIT_EXTERN NSString *const kAnyActivityList       ; // 活动列表
UIKIT_EXTERN NSString *const kAnyActivityDetail     ; //活动详情

// 门禁广告
UIKIT_EXTERN NSString *const kAnyQRCodeBanner       ; // 门禁广告
// 二维码时长 // Entrance_Control_OrCode_Generation_Time
UIKIT_EXTERN NSString *const kAnyQRGenerateTime          ;
UIKIT_EXTERN NSString *const kAnyQRReGenerateTime        ;

NS_ASSUME_NONNULL_BEGIN

@interface LZMDataAnalysis : NSProxy

#pragma mark - 页面统计
+ (void)beginLogPageView:(NSString *)identifer;
+ (void)endLogPageView:(NSString *)identifer;
+ (void)pageEvent:(NSString *)event;

#pragma mark - 事件统计
+ (void)actionEvent:(NSString *)event eventId:( NSString * _Nonnull )eventId;


#pragma mark - 时长统计
//+ (void)timeBeginEvent:(NSString *)event;
//+ (void)timeEndEvent:(NSString *)event;
+ (void)timeEvent:(NSString *)event eventId:(NSString *)eventId seconds:(int)millseconds;


@end

NS_ASSUME_NONNULL_END
