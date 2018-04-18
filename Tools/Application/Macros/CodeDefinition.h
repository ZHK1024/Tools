//
//  CodeDefinition.h
//  WeiQianDai
//
//  Created by Apple-T on 16/5/11.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

//屏幕的bounds
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
//debug随机颜色
#define DEBUG_COLOR [UIColor colorWithRed:(arc4random()%255)/255.0f green:(arc4random()%255)/255.0f blue:(arc4random()%255)/255.0f alpha:1.0]
//frame
#define FRAME(X, Y, W, H) CGRectMake((X), (Y), (W), (H))
//RGB创建颜色
#define COLOR(R, G, B, A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]
// weak self 
#define WS(ws) __weak typeof(self) ws = self

#define Ratio_X ([UIScreen mainScreen].bounds.size.width / 320.0)
#define Ratio_Y [UIScreen mainScreen].bounds.size.height / 568.0

// UIStoryBoard
#define STORY_BOARD(name, bundle) [UIStoryboard storyboardWithName:name bundle:bundle]

// service phone key
#define SERVICE_PHONE_KEY @"SERVICE_PHONE_KEY"
// scrvice phone
#define SERVICE_PHONE [[NSUserDefaults standardUserDefaults] valueForKey:SERVICE_PHONE_KEY]
// work time key
#define WORK_TIME_KEY @"WORK_TIME_KEY"
// work time
#define WORK_TIME [[NSUserDefaults standardUserDefaults] valueForKey:WORK_TIME_KEY]

// 微信公众号 id
#define WX_ID_KEY @"WX_ID_KEY"
#define WX_ID [[NSUserDefaults standardUserDefaults] valueForKey:WX_ID_KEY]

// 微信二维码
#define WX_QR_KEY @"WX_QR_KEY"
#define WX_QR [[NSUserDefaults standardUserDefaults] valueForKey:WX_QR_KEY]

// 借款攻略
#define BORROW_STRATEGY_KEY @"BORROW_STRATEGY_KEY"
#define BORROW_STRATEGY [[NSUserDefaults standardUserDefaults] valueForKey:BORROW_STRATEGY_KEY]

