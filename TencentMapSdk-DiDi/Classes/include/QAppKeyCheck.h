/*
 ============================================================================
 Name           : QAppKeyCheck.h
 Author         : 腾讯SOSO地图API
 Version        : 1.0
 Copyright      : 腾讯
 Description    : QAppKeyCheck,QAppKeyCheckDelegate declaration
 ============================================================================
 */

#import <Foundation/Foundation.h>
#import "QTypes.h"
/**
 *QAppKeyCheckDelegate:app key 验证的代理
 *Author:ksnowlv
 **/
@protocol QAppKeyCheckDelegate <NSObject>

/**
 *通知APPKey验证的结果
 *@param errCode 见QErrorCode定义
 */
-(void)notifyAppKeyCheckResult:(QErrorCode)errCode;

@end

/**
 *QAppKeyCheck:app key 验证
 *Author:ksnowlv
 **/
@interface QAppKeyCheck : NSObject
/**
 *用户传入的唯一识别ID
 */
@property(class, nonatomic,strong)NSString* suid;

/**
 *Map SDK 生成的唯一id
 */
@property(class, nonatomic,readonly,)NSString* mapGenerateId;

/**
 *版本号 2.1.1.09
 */
@property(class, nonatomic,readonly)NSString* version;

/**
 *vendorID 从sdk获取当前手机的vendorID，
 */
@property(class,nonatomic,readonly)NSString* vendorID;

/**
 * 滴滴专快司机端初始化使用
 * @param 是否是专快司机端使用，如果是NO则是乘客端使用
 */
-(instancetype)initWithDriverFlag:(BOOL)isDriver __attribute__ ((deprecated("use (initWithDidiTypeFlag:) instead")));

/**
 * 滴滴客户端初始化使用
 * @param 
 */
-(instancetype)initWithDidiTypeFlag:(QMapDidiType)didiType;

/**
 *启动APPKey验证
 *@param key 申请的有效key
 *@param delegate 代理
 */
-(BOOL)start:(NSString*)key withDelegate:(id<QAppKeyCheckDelegate>)delegate;

/**
 *停止或取消APPKey验证
 */
-(void)stop;

/**
 *彩虹蚯蚓刷新的时间间隔，单位：秒， 默认60，可以云控
 */
+ (CGFloat)refreshTime;

@end
