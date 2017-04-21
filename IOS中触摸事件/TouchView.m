//
//  TouchView.m
//  IOS中触摸事件
//
//  Created by 王伟 on 2017/4/20.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "TouchView.h"

@interface TouchView ()



@end

@implementation TouchView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addTapGestureRecognizer];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self addTapGestureRecognizer];
    }
    
    return self;
}

// 初始化
+ (instancetype)touchViewWithTapAction:(TapAction)block {
    TouchView *touchView = [[TouchView alloc] init];
    touchView.touchAction = block;
    return touchView;
}

// 添加点击事件
- (void)addTapGestureRecognizer {

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAction:)];
    [self addGestureRecognizer:tap];
}

- (void)touchAction:(UITapGestureRecognizer *)tap {

    if (_touchAction) {
        _touchAction();
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    // 获取UITouch触摸时的时间、位置、view、window、type等
//    UITouch *touch = [touches anyObject];
//    NSLog(@"开始触摸时touches: %@",touches);
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    // 获取UITouch触摸时的位置和之前的位置
    // 拿到UITouch就能获取当前点
    UITouch *touch = [touches anyObject];
    // 获取当前点
    CGPoint currentP = [touch locationInView:self];
    // 获取上一个点
    CGPoint previousP = [touch previousLocationInView:self];
    
    // 计算偏移量
    CGFloat offsetX = currentP.x - previousP.x;
    CGFloat offsetY = currentP.y - previousP.y;
    
    // 平移
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    
    // 设定活动区域，判断是否在侧边
    [self setViewInSide];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
   
    
    /*
    NSLog(@"(self.frame.origin.x + self.frame.size.width * 0.5)= %f",(self.frame.origin.x + self.frame.size.width * 0.5));
    NSLog(@"self.center.x= %f",self.center.x);
    NSLog(@"self.actRect.size.width * 0.5= %f", self.actRect.size.width * 0.5);
     */

    if (_isAutoRemove) {
        if ((self.frame.origin.x + self.frame.size.width * 0.5) <= self.actRect.size.width * 0.5) {
            [UIView animateWithDuration:0.2 animations:^{
                
                self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
            }];
            
        } else {
            [UIView animateWithDuration:.2 animations:^{
               
                self.frame = CGRectMake(CGRectGetMaxX(self.actRect) - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
            }];
        }
    }

    
}


// 判断是否在侧边
- (void)setViewInSide {
    
    if (self.actRect.size.width == 0 && self.actRect.size.height == 0 && self.actRect.origin.x == 0 && self.actRect.origin.y == 0) {
        return;
    }
    
    if (self.frame.origin.x < self.actRect.origin.x) {
        self.frame = CGRectMake(self.actRect.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    }
    
    if (self.frame.origin.y < self.actRect.origin.y) {
        self.frame = CGRectMake(self.frame.origin.x, self.actRect.origin.y, self.frame.size.width, self.frame.size.height);
    }
    
    if (CGRectGetMaxX(self.frame) > CGRectGetMaxX(self.actRect)) {
        self.frame = CGRectMake(CGRectGetMaxX(self.actRect) - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    }
    
    if (CGRectGetMaxY(self.frame) > CGRectGetMaxY(self.actRect)) {
        self.frame = CGRectMake( self.frame.origin.x , CGRectGetMaxY(self.actRect) - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    }
}

@end
