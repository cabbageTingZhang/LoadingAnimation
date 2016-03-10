//
//  ArcTocircleLayer.h
//  IOSTests
//
//  Created by mac-mini-ios on 16/1/12.
//  Copyright © 2016年 mac-mini-ios. All rights reserved.
//  属性变化触发重绘

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface ArcTocircleLayer : CALayer
@property (nonatomic) CGFloat progress;///<进度
@property (nonatomic) UIColor *color;///<颜色
@property (nonatomic) CGFloat lineWidth;///<线宽

@end
