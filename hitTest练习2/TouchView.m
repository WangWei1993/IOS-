//
//  TouchView.m
//  IOS中触摸事件
//
//  Created by 王伟 on 2017/4/21.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "TouchView.h"

@interface TouchView ()
@property (strong, nonatomic) IBOutlet UIButton *btn;

@end

@implementation TouchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@---touch",[self class]);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"hitTest---");
    // 判断点击是否落在里面的button上面
    CGPoint p = [self convertPoint:point toView:self.btn];
    if ([self.btn pointInside:p withEvent:event]) {
        return self.btn;
    }
    return [super hitTest:point withEvent:event];
}

@end
