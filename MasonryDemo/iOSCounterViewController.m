//
//  iOSCounterViewController.m
//  MasonryDemo
//
//  Created by Mrr on 16/3/31.
//  Copyright © 2016年 lnzsbks. All rights reserved.
//


//  Masonry ---计算器

#import "iOSCounterViewController.h"
#import <Masonry.h>

@interface iOSCounterViewController ()

@end

@implementation iOSCounterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeConstomUIandLayout];
}

- (void)makeConstomUIandLayout{
    __weak typeof(self)weakSelf = self;
    //申明显示区域&键盘区域
    UIView *displayView = [UIView new];
    [displayView setValue:[UIColor blackColor] forKey:@"backgroundColor"];
    [self.view addSubview:displayView];
    
    UIView *keyboardView = [UIView new];
    [self.view addSubview:keyboardView];
    
    //按1：3分割两部分区域
    [displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        //左右临边
        make.left.and.right.equalTo(weakSelf.view);
        //顶部贴边
        make.top.equalTo(weakSelf.view.mas_top);
        //高度
        make.height.equalTo(keyboardView.mas_height).multipliedBy(0.3);
        
    }];
    [keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        //左右临边
        make.left.and.right.equalTo(weakSelf.view);
        //下部贴边
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        //上部贴上底
        make.top.equalTo(displayView.mas_bottom);

    }];
    //设置显示区域显示项目
    UILabel *displayLabel      = [[UILabel alloc]init];
    [displayView addSubview:displayLabel];
    displayLabel.text          = @"0";
    displayLabel.font          = [UIFont fontWithName:@"HeiTi SC" size:70];
    displayLabel.textColor     = [UIColor whiteColor];
    displayLabel.textAlignment = NSTextAlignmentRight;
    
    [displayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    //定义键盘名称 -- ?代表合并的单元格
    NSArray *keyBoardName = @[@"AC",@"+/-",@"%",@"/",
                              @"7",@"8",@"9",@"*",
                              @"4",@"5",@"6",@"-",
                              @"1",@"2",@"3",@"+",
                              @"0",@"?",@".",@"="];
    
    //遍历创建并添加约束
    [keyBoardName enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //计算行 & 列
        NSString *currentStr = obj;
        NSInteger colNum = idx/4 + 1;
        NSInteger rowNum = idx%4 + 1;
        NSLog(@"第%ld行,第%ld个 --- %@",colNum,rowNum,currentStr);
        
        //创建UI
        UIButton *keyBoardBtn       = [[UIButton alloc]init];
        [keyBoardBtn setTitle:currentStr forState:UIControlStateNormal];
        [keyboardView addSubview:keyBoardBtn];
        [keyBoardBtn.layer setBorderWidth:1];
        [keyBoardBtn.layer setBorderColor:[UIColor blackColor].CGColor];
        [keyBoardBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        keyBoardBtn.titleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:30];
        
        //设置约束
        [keyBoardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //判断是否为和并键
            if ([currentStr isEqualToString:@"0"] || [currentStr isEqualToString:@"?"]) {
                //合并键
                if ([currentStr isEqualToString:@"0"]) {
                    //把0键位添加约束
                    make.left.and.bottom.equalTo(keyboardView);
                    make.height.mas_equalTo(keyboardView.mas_height).multipliedBy(.2f);
                    make.width.mas_equalTo(keyboardView.mas_width).multipliedBy(0.5);
                }else{
                    [keyBoardBtn removeFromSuperview];
                }
            }else{
                //正常键
                //设置宽高
                make.height.mas_equalTo(keyboardView.mas_height).multipliedBy(.2f);
                make.width.mas_equalTo(keyboardView.mas_width).multipliedBy(.25f);
                //行--
                
                
                switch (colNum) {
                    case 1:
                        make.centerY.equalTo(keyboardView.mas_centerY).multipliedBy(.2f);

                        break;
                    case 2:
                        make.centerY.equalTo(keyboardView.mas_centerY).multipliedBy(.6f);

                        break;
                    case 3:
                        make.centerY.equalTo(keyboardView.mas_centerY).multipliedBy(1);
                
                        break;
                    case 4:
                        
                        make.centerY.equalTo(keyboardView.mas_centerY).multipliedBy(1.4f);
                    
                        break;
                    case 5:
                        make.centerY.equalTo(keyboardView.mas_centerY).multipliedBy(1.8f);
                        
                        break;
                        
                    default:
                        break;
                }
                
                //列--
                switch (rowNum) {
                    case 1:
                        make.centerX.equalTo(keyboardView.mas_centerX).multipliedBy(.25f);
                        
                        break;
                    case 2:
                        make.centerX.equalTo(keyboardView.mas_centerX).multipliedBy(.75f);
                        
                        break;
                    case 3:
                        make.centerX.equalTo(keyboardView.mas_centerX).multipliedBy(1.25f);
                        
                        break;
                    case 4:
                        make.centerX.equalTo(keyboardView.mas_centerX).multipliedBy(1.75f);
                        
                        break;
                        
                    default:
                        break;
                }
                
            }
        }];
    }];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
