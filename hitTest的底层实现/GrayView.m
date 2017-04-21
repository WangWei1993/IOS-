//
//  GrayView.m
//  IOS中触摸事件
//
//  Created by 王伟 on 2017/4/21.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "GrayView.h"

@implementation GrayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    /*底层实现hitTest方法*/
    
    // 1. 判断是否可以点击
    if (self.alpha <= 0.01 || self.hidden == YES || self.userInteractionEnabled == NO) {
        return nil;
    }
    
    // 2. 判断点是否在当前View内
    BOOL isLocationView = [self pointInside:point withEvent:event];
    if (!isLocationView) {
        return nil;
    }
    
    // 3. 遍历自己子控件，如果是合适的View就返回
    NSInteger count = self.subviews.count;
    for (NSInteger i = count-1; i>=0; i--) {
        
        UIView *subV = self.subviews[i];
        
        // 将坐标转成子控件上的坐标
        CGPoint childP = [self convertPoint:point toView:subV];
        
        // 判断是否有合适的View
        UIView *fitView = [subV hitTest:childP withEvent:event];
        if (fitView) {
            return fitView;
        }
    }
    
    // 4. 子控件内没有的话，那么自己就是最合适的
    return self;
}

@end
