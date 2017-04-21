//
//  BlueView.m
//  IOS中触摸事件
//
//  Created by 王伟 on 2017/4/21.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 寻找到最合适的View，当事件传递到当前View的时候调用
/*
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@ --- hitTest", [self class]);
    return [super hitTest:point withEvent:event];
}
 */

// 判断point是不是在方法调用者（View）上，hitTest底层会自动调用此方法
// 要求point是在方法调用者（View）的坐标系
/*
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@ --- pointInside", [self class]);
    return NO;
}
 */

@end
