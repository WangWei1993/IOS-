//
//  TouchView.h
//  IOS中触摸事件
//
//  Created by 王伟 on 2017/4/20.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapAction)(void);

@interface TouchView : UIView

/** View的活动区域 */
@property (nonatomic, assign) CGRect actRect;

/** 是否自动移到两侧 */
@property (nonatomic, assign) BOOL isAutoRemove;

/** block */
@property (nonatomic, copy) TapAction touchAction;

/** 
 *  初始化
 *
 *  @param block 回调
 */
+ (instancetype)touchViewWithTapAction:(TapAction)block;

@end
