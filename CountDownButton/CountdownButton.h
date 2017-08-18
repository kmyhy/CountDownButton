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

/** 可视化设置边框宽度 */
@property (nonatomic, assign)IBInspectable CGFloat borderWidth;
/** 可视化设置边框颜色 */
@property (nonatomic, strong)IBInspectable UIColor *borderColor;
/** 可视化设置圆角 */
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;

@property(strong,nonatomic)NSString* countdownFormat;

@property(strong,nonatomic)NSString* nextTitle;

-(void)countdown;
-(void)stopCountdown;
@end
