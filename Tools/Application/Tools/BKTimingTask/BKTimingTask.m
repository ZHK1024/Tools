//
//  BackGroundTimingTask.m
//  Tools
//
//  Created by ZHK on 2018/4/17.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "BKTimingTask.h"
#import <UIKit/UIKit.h>

static BKTimingTask *task = nil;
// 延时
static NSTimeInterval second_tk = 0.0f;

static UIBackgroundTaskIdentifier taskIdentifier;

@interface BKTimingTask ()

@property (nonatomic, strong) NSMutableArray *tasks;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation BKTimingTask

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [BKTimingTask task];
    });
}

+ (instancetype)task {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        task = [[BKTimingTask alloc] init];
        
        // 进入前台直接执行任务
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [task performTasks];
        }];
        // 进入后台注册后台任务
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [task registBackGroundTask];
        }];
    });
    return task;
}

/**
 设置延时时间
 
 @param second 延时时间(秒)
 */
+ (void)setTime:(NSTimeInterval)second {
    second_tk = second;
}

+ (void)addTask:(TimingTaskBlock)task {
    [BKTask addTask:task];
}

#pragma mark -

/**
 注册后台任务
 */
- (void)registBackGroundTask {
    UIApplication *app = [UIApplication sharedApplication];

    taskIdentifier =
    [app beginBackgroundTaskWithExpirationHandler:^{
        [app endBackgroundTask:taskIdentifier];
        
    }];
    // 延时调用
    __weak typeof(task) weakTask = task;
    task.timer = [NSTimer scheduledTimerWithTimeInterval:second_tk target:weakTask selector:@selector(performTasks) userInfo:nil repeats:NO];
}

/**
 设置延时时间
 
 @param second 延时时间(秒)
 */
- (void)setTime:(NSTimeInterval)second {
    second_tk = second;
}

/**
 添加定时任务
 
 @param task 任务
 */
- (void)addTask:(TimingTaskBlock)task {
    [self.tasks addObject:task];
}

#pragma mark -

/**
 执行所有任务
 */
- (void)performTasks {
    for (TimingTaskBlock task in _tasks) {
        task();
    }
    if (_timer) {
        [_timer invalidate];
        self.tasks = nil;
    }
}

#pragma mark - Getter

- (NSMutableArray *)tasks {
    if (_tasks == nil) {
        self.tasks = [NSMutableArray new];
    }
    return _tasks;
}

@end
