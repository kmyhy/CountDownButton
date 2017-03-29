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
    _button.countdownFormat = @"%2d 秒";
    _button.maxCountdown = 10;
    _button.updateInterval = 1;
    
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
