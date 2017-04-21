//
//  ViewController.m
//  IOS中触摸事件
//
//  Created by 王伟 on 2017/4/20.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"

@interface ViewController ()

@property (nonatomic, weak) TouchView *touchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 给UIView添加手势
    //TouchView *touchView = [[TouchView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    TouchView *touchView = [TouchView touchViewWithTapAction:^{
        
    }];
    touchView.frame = CGRectMake(100, 100, 100, 100);
    
    // 活动区域
    touchView.actRect = self.view.frame;
    // 是否自动移动到两边
    touchView.isAutoRemove = YES;
    
    self.touchView = touchView;
    touchView.backgroundColor = [UIColor redColor];
    [self.view addSubview:touchView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
