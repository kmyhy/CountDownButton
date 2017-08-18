//
//  CountdownButton.m
//  CountDownButton
//
//  Created by qq on 2017/2/15.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "CountdownButton.h"

@interface CountdownButton(){
    CADisplayLink *displayLink;
    BOOL timerStopped;
}
@end

@implementation CountdownButton

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
    timerStopped= YES;
    _maxCountdown = 60; // 倒计时时间，单位秒
    _countdownFormat = @"%d秒"; // 倒计时时，button 上的标题格式
    _updateInterval = 1; // 倒计时刷新时间，默认 1 秒。这东西会影响从后台转到前台的刷新效果。
    
}
-(void)countdownPerSecond:(CADisplayLink *)sender{
    
    if(timerStopped == NO){ // timerStopped == NO 表示在倒计时中
        // 正在倒计时，按每秒更新
        double now = CACurrentMediaTime();
        double deltaTime = now - _lastTime;
        
        //    NSLog(@"deltaTime:%f,lastTime:%f,now:%f",deltaTime,_lastTime,now);
        if(deltaTime >= _updateInterval){// 超过了倒计时刷新间隔
            _lastTime = now;
            double ellapse = now - _beginTime;
            if( ellapse >= _maxCountdown){// 倒计时结束
                _beginTime = 0;
                timerStopped = YES;
                self.enabled = YES;
                if (self.nextTitle) {
                    [self setTitle:self.nextTitle forState:UIControlStateNormal];
                }
                
            }else{
                double currentCountdown = _maxCountdown-ellapse;
                // 开始计数的基数+1，比如10秒倒计时从10开始，10，9，8，7...1
                [self setTitle:[NSString stringWithFormat:_countdownFormat,(int)currentCountdown+1] forState:UIControlStateDisabled];
            }
        }
    }else{
        if (self.nextTitle) {
            [self setTitle:self.nextTitle forState:UIControlStateNormal];
        }
        [displayLink invalidate];
    }
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) countdown
{
    if(timerStopped){
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(countdownPerSecond:)];
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        _beginTime = CACurrentMediaTime();
        self.enabled = NO;
        timerStopped = NO;
        [self setNeedsDisplay];
    }
    
}
-(void)stopCountdown{
    if(timerStopped == NO){
        if(displayLink){
            [displayLink invalidate];
        }
        timerStopped = YES;
    }
}

/**
 *  设置边框宽度
 *
 *  @param borderWidth 可视化视图传入的值
 */
- (void)setBorderWidth:(CGFloat)borderWidth {
    
    if (borderWidth < 0) return;
    
    self.layer.borderWidth = borderWidth;
}

/**
 *  设置边框颜色
 *
 *  @param borderColor 可视化视图传入的值
 */
- (void)setBorderColor:(UIColor *)borderColor {
    
    self.layer.borderColor = borderColor.CGColor;
}

/**
 *  设置圆角
 *
 *  @param cornerRadius 可视化视图传入的值
 */
- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}
@end
