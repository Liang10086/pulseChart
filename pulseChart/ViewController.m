//
//  ViewController.m
//  pulseChart
//
//  Created by 王明亮 on 2018/6/6.
//  Copyright © 2018年 王明亮. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextView *viwe = [[UITextView alloc]init];
    viwe.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 200, 300, 300)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    UIBezierPath *path = [[UIBezierPath alloc]init];
    path.lineCapStyle = kCGLineCapRound;
    [path moveToPoint:CGPointMake(50, 200)];
    [path addQuadCurveToPoint:CGPointMake(100, 200) controlPoint:CGPointMake(50, 100)];
    [path addArcWithCenter:CGPointMake(100, 200) radius:1 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [path addQuadCurveToPoint:CGPointMake(200, 100) controlPoint:CGPointMake(300, 200)];
    [path addArcWithCenter:CGPointMake(200, 100) radius:1 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 5;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.repeatCount = CGFLOAT_MAX;
    
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.path = path.CGPath;
    layer.lineWidth = 0.5;
    layer.lineCap = kCALineCapRound;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
    [view.layer addSublayer:layer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
