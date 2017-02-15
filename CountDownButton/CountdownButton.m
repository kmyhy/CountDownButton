//
//  CountdownButton.m
//  CountDownButton
//
//  Created by qq on 2017/2/15.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "CountdownButton.h"

@implementation CountdownButton{
    CADisplayLink *displayLink;
    BOOL restoredTitle;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self xibSetup];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self xibSetup];
    }
    return self;
}
-(void)xibSetup{
    _maxCountdown = 60; // 倒计时时间，单位秒
    _countdownFormat = @"%d秒"; // 倒计时时，button 上的标题格式
    _updateInterval = 1; // 倒计时刷新时间，默认 1 秒。这东西会影响从后台转到前台的刷新效果。
    
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(countdownPerSecond:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    _lastTime = CACurrentMediaTime();

}
-(void)countdownPerSecond:(CADisplayLink *)sender{
    
    if(_beginTime == 0){ // 没有倒计时，按正常帧率走
        if(!restoredTitle){
            [self setTitle:_originTitle forState:UIControlStateNormal];
            restoredTitle = NO;
        }
    }else{// 正在倒计时，按每秒更新
        double now = CACurrentMediaTime();
        double deltaTime = now - _lastTime;
        
        //    NSLog(@"deltaTime:%f,lastTime:%f,now:%f",deltaTime,_lastTime,now);
        if(deltaTime >= _updateInterval){// 超过了倒计时刷新间隔
            _lastTime = now;
            double ellapse = now - _beginTime;
            if( ellapse >= _maxCountdown){
                _beginTime = 0;
                self.enabled = YES;
            }else{
                double currentCountdown = _maxCountdown-ellapse;
                [self setTitle:[NSString stringWithFormat:_countdownFormat,(int)currentCountdown] forState:UIControlStateNormal];
            }
        }
    }
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) countdown
{
    if(_beginTime == 0){
        _beginTime = CACurrentMediaTime();
        self.enabled = NO;
        [self setNeedsDisplay];
    }
    
}

@end
