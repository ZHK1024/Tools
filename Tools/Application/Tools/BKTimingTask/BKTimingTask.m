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

// task identifier
static UIBackgroundTaskIdentifier taskIdentifier;

// add task block
static void(^addTask)(TimingTaskBlock task);

@interface BKTimingTask ()

@property (nonatomic, strong) NSMutableArray *tasks;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation BKTimingTask

/**
 load 注册相关内容
 */
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [BKTimingTask task];
    });
}

/**
 获取单例对象
 
 @return 单例对象
 */
+ (instancetype)task {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        task = [[BKTimingTask alloc] init];
        
        // 进入前台直接执行任务
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            if (BKTask.performTasksWhenApplicationDidBecomeActive) {
                [task performTasks];
            }
        }];
        
        // 进入后台注册后台任务
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [task registBackGroundTask];
        }];
        
        // 应用退出时执行
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillTerminateNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            if (BKTask.performTasksWhenApplicationWillTerminate) {
                [task performTasks];
            }
        }];
        
        __weak typeof(task) weakTask = task;
        // 初始化添加 task 的 block
        addTask = ^(TimingTaskBlock task) {
            [weakTask.tasks addObject:task];
        };
    });
    return task;
}

#pragma mark - Public

/**
 取消所有任务
 */
- (void)cancelTasks {
    [self.tasks removeAllObjects];
}

#pragma mark - Private

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
    // 此处不能用 dispatch_after, 不会进行延迟调用.
    __weak typeof(task) weakTask = task;
    task.timer = [NSTimer scheduledTimerWithTimeInterval:second_tk target:weakTask selector:@selector(performTasks) userInfo:nil repeats:NO];
}

/**
 执行所有任务
 */
- (void)performTasks {
    for (TimingTaskBlock task in _tasks) {
        task();
    }
    // 执行完成则移除所有任务
    if (_removeTasksWhenFinshed) {
        [_tasks removeAllObjects];
    }
    if (_timer) {
        [_timer invalidate];
        self.tasks = nil;
    }
}

#pragma mark - Setter

- (void)setSecond:(NSTimeInterval)second {
    second_tk = second;
}

#pragma mark - Getter

- (void (^)(TimingTaskBlock))addTask {
    return addTask;
}

- (NSTimeInterval)second {
    return second_tk;
}

- (NSMutableArray *)tasks {
    if (_tasks == nil) {
        self.tasks = [NSMutableArray new];
    }
    return _tasks;
}

@end
