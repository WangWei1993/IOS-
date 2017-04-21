//
//  ViewController.m
//  hitTest练习
//
//  Created by 王伟 on 2017/4/21.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"
#import "CoverView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet CoverView *coverV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.coverV.btn = self.btn;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
