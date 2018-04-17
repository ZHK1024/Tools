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

@property (nonatomic, assign) NSTimeInterval second;

/**
 当应用退出时候但倒计时未到, 是否立刻执行所有任务
 */
@property (nonatomic, assign) BOOL performTasksWhenApplicationWillTerminate;

/**
 当应用进入前台时候立刻执行所有任务
 */
@property (nonatomic, assign) BOOL performTasksWhenApplicationDidBecomeActive;

/**
 当任务执行完成移除任务
 */
@property (nonatomic, assign) BOOL removeTasksWhenFinshed;

/**
 添加任务
 */
@property (nonatomic, copy) void(^addTask)(TimingTaskBlock task);

/**
 获取单例对象

 @return 单例对象
 */
+ (instancetype)task;

#pragma mark -

/**
 取消所有任务
 */
- (void)cancelTasks;

@end
