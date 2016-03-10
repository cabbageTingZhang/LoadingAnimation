//
//  ArcTocircleLayer.m
//  IOSTests
//
//  Created by mac-mini-ios on 16/1/12.
//  Copyright © 2016年 mac-mini-ios. All rights reserved.
//

#import "ArcTocircleLayer.h"

static CGFloat const kLineWidth = 6;//线条的宽度

@implementation ArcTocircleLayer

@dynamic progress;
@dynamic color;
@dynamic lineWidth;

//属性变化触发重绘,当progress的值改变的时候,CALayer会标记自己为需要重绘
//Subclasses can override this method and return YES
//if the layer should be redisplayed when the value of the specified attribute changes. Animations changing the value of the attribute also trigger redisplay.
+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"progress"])
    {
        return YES;
    }
    else if ([key isEqualToString:@"color"])
    {
        return YES;
    }
    else if ([key isEqualToString:@"lineWidth"])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

//以下是两个点的运动轨迹 O:为开始点 D:为结束点
//O:7 * π / 2 - (7 * π / 2 - 2π) * progress
//D:3 * π - (3 * π - 0) * progress
- (void)drawInContext:(CGContextRef)ctx
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat radius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2 - kLineWidth / 2;
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    //O
    CGFloat originStart = M_PI * 7 / 2;
    CGFloat originEnd = M_PI * 2;
    CGFloat currentOrigin = originStart - (originStart - originEnd) * self.progress;
    
    //D
    CGFloat destStart = M_PI * 3;
    CGFloat destEnd = 0;
    CGFloat currentDest = destStart - (destStart - destEnd) * self.progress;
    
    
    //弧的圆心arcCenter，弧的半径arcRadius，开始角度（我们前文中用O点代表），结束角度（用D点代表）
    [path addArcWithCenter:center radius:radius startAngle:currentOrigin endAngle:currentDest clockwise:NO];
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, self.lineWidth);
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    CGContextStrokePath(ctx);
}


@end
