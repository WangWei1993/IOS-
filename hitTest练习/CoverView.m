//
//  CoverView.m
//  IOS中触摸事件
//
//  Created by 王伟 on 2017/4/21.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "CoverView.h"

@interface CoverView ()


@end

@implementation CoverView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)click:(id)sender {

    
    NSLog(@"我被点击了，哈哈");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@---touch",[self class]);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 判断点是否点击在btn上
    CGPoint p = [self convertPoint:point toView:self.btn];
    if ([self.btn pointInside:p withEvent:event]) {
        return self.btn;
    }
    return [super hitTest:point withEvent:event];
    
}

@end
