//
//  CountdownButton.h
//  CountDownButton
//
//  Created by qq on 2017/2/15.
//  Copyright © 2017年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownButton : UIButton
@property(assign,nonatomic)UIBackgroundTaskIdentifier backgroundTask;
@property(assign,nonatomic)double maxCountdown,currentCountdown;
@property(assign,nonatomic)double lastTime;
@property(assign,nonatomic)double beginTime;
@property(assign,nonatomic)double updateInterval;

@property(strong,nonatomic)NSString* originTitle;
@property(strong,nonatomic)NSString* countdownFormat;

-(void)countdown;
@end
