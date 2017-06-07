//
//  ViewController.m
//  ZFBChangeView
//
//  Created by admin on 2017/6/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIView *backview;
    UIView *topview;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    backview = [[UIView alloc] initWithFrame:CGRectMake(150, 200, 200, 100)];
    [backview setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:backview];
    
    UILabel *lb1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 25)];
    lb1.text=@"我是One";
    lb1.font=[UIFont systemFontOfSize:10];
    lb1.textAlignment=NSTextAlignmentCenter;
    lb1.textColor=[UIColor redColor];
    [backview addSubview:lb1];
    backview.hidden=YES;
    
    
    topview = [[UIView alloc] initWithFrame:CGRectMake(150, 200, 200, 100)];
    [topview setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:topview];
    
    UILabel *lb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 25)];
    lb.text=@"我是Two";
    lb.font=[UIFont systemFontOfSize:10];
    lb.textAlignment=NSTextAlignmentCenter;
    lb.textColor=[UIColor redColor];
    [topview addSubview:lb];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSString *type;
    if (topview.hidden) {
        type=kCATransitionFromLeft;
    }else{
        type=kCATransitionFromRight;
    }
    
    [self transitionWithType:@"oglFlip" WithSubtype:type ForView:self.view];

}
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = 1;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [topview.layer addAnimation:animation forKey:@"animation"];
        [backview.layer addAnimation:animation forKey:@"animation"];
        
    } completion:^(BOOL finished) {
        if (backview.hidden) {
            topview.hidden=YES;
            backview.hidden=NO;
        }else{
            topview.hidden=NO;
            backview.hidden=YES;
        }
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
