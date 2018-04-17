//
//  BackGroundTimingTask.h
//  Tools
//
//  Created by ZHK on 2018/4/17.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BKTask [BKTimingTask task]

typedef void(^TimingTaskBlock)(void);

@interface BKTimingTask : NSObject

/**
 获取单例对象

 @return 单例对象
 */
+ (instancetype)task;

#pragma mark -

/**
 设置延时时间

 @param second 延时时间(秒)
 */
+ (void)setTime:(NSTimeInterval)second;

/**
 添加定时任务

 @param task 任务
 */
+ (void)addTask:(TimingTaskBlock)task;

#pragma mark -

/**
 设置延时时间
 
 @param second 延时时间(秒)
 */
- (void)setTime:(NSTimeInterval)second;

/**
 添加定时任务
 
 @param task 任务
 */
- (void)addTask:(TimingTaskBlock)task;

@end
