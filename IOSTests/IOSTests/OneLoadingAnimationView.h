//
//  OneLoadingAnimationView.h
//  IOSTests
//
//  Created by mac-mini-ios on 16/1/12.
//  Copyright © 2016年 mac-mini-ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneLoadingAnimationView : UIView

/**
 *  加载成功动画动作
 */
- (void)startSuccess;


/**
 *  加载失败动画动作
 */
- (void)startFail;

@end
