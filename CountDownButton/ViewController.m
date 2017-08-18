//
//  ViewController.m
//  CountDownButton
//
//  Created by qq on 2017/2/15.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Toast.h"
#import "CountdownButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CountdownButton *button;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_button setTitle: @"获取验证码" forState:UIControlStateNormal];
    _button.countdownFormat = @"%2d秒后重新获取";
    _button.nextTitle = @"重新获取";
    _button.maxCountdown = 10;
    _button.updateInterval = 0.1;
    _button.borderWidth = 1;
    _button.borderColor = [UIColor whiteColor];
    _button.cornerRadius = 14;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    [_button countdown];
    [self.view makeToast:@"验证码发送成功，请注意查收短信"];
}



@end
