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

@interface BKTimingTask ()

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
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            NSLog(@"UIApplicationWillEnterForegroundNotification");
        }];
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            NSLog(@"UIApplicationDidBecomeActiveNotification");
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
//    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillEnterForegroundNotification object:nil queue:nil usingBlock:task];
}

@end
