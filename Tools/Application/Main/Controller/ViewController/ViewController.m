//
//  ViewController.m
//  Tools
//
//  Created by ZHK on 2018/4/17.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ViewController.h"
#import "BKTimingTask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BKTask.second = 10.0f;
    BKTask.maxTaskNums = 1;
    BKTask.performTasksWhenApplicationWillTerminate = YES;
    BKTask.removeTasksWhenFinshed = YES;
    BKTask.addTask(^{
        NSLog(@"aaa");
    });
    BKTask.addTask(^{
        NSLog(@"bbb");
    });
    
    BKTask.addTask(^{
        NSLog(@"ccc");
    }).addTask(^{
        NSLog(@"ddd");
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
