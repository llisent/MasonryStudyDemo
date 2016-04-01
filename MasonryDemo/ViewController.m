//
//  ViewController.m
//  MasonryDemo
//
//  Created by Mrr on 16/3/31.
//  Copyright © 2016年 lnzsbks. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "iOSCounterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatCostomUI];
}

- (void)creatCostomUI{
    __weak typeof(self)weakSelf = self;
    
    //底层View
    UIView *firstView = [UIView new];
    firstView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:firstView];
    
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    //红色浮层View
//    UIView *secondView = [UIView new];
//    secondView.backgroundColor = [UIColor redColor];
//    [firstView addSubview:secondView];
//    
//    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(firstView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
    
//    [初级] 让两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
    
    //leftView
    UIView *leftView = [UIView new];
    leftView.backgroundColor = [UIColor orangeColor];
    [firstView addSubview:leftView];
    
    //rightView
    UIView *rightView = [UIView new];
    rightView.backgroundColor = [UIColor orangeColor];
    [firstView addSubview:rightView];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(firstView.mas_centerY);
        //高度150
        make.height.mas_equalTo(150);
        //左右view同宽
        make.width.mas_equalTo(rightView.mas_width);
        //距离左边距10像素
        make.left.mas_equalTo(firstView.mas_left).offset(10);
        //距离右边距10像素
        make.right.mas_equalTo(rightView.mas_left).offset(-10);
        
        

    }];
    
    

    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(firstView.mas_centerY);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(leftView.mas_width);
        make.right.mas_equalTo(firstView.mas_right).offset(-10);
        make.left.mas_equalTo(leftView.mas_right).offset(10);



    }];

}









- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    iOSCounterViewController *vc = [[iOSCounterViewController alloc]init];
    [self presentViewController:vc animated:YES completion:^{
        NSLog(@"2333");
    }];
}



















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
