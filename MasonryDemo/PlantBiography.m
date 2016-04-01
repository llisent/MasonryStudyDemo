//
//  PlantBiography.m
//  MasonryDemo
//
//  Created by Mrr on 16/4/1.
//  Copyright © 2016年 lnzsbks. All rights reserved.
//

#import "PlantBiography.h"
#import <Masonry.h>

@interface PlantBiography ()

@end

@implementation PlantBiography

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatConstomUI];
}

- (void)creatConstomUI{
    __weak typeof(self)weakSelf = self;
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    UIImageView *plantImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"inst_pinganbank"]];
    UILabel *plantName    = [[UILabel alloc]init];
    
    plantName.text            = @"海棠01";
    plantName.backgroundColor = [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1];
    plantName.textColor       = [UIColor whiteColor];
    plantName.font            = [UIFont fontWithName:@"HelveticaNeue-Bold" size:25];
    
    [self.view addSubview:plantName];
    [self.view addSubview:plantImg];
    
    
    [plantImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(10);
        make.top.equalTo(weakSelf.view).offset(74);
        
    }];
    
    [plantName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view);
        make.left.equalTo(plantImg.mas_right).offset(10);
        make.height.equalTo(plantImg.mas_height).multipliedBy(0.5f);
        make.centerY.equalTo(plantImg);
    }];
    
    //植物养护 以下
    
    UILabel *titleFirst  = [[UILabel alloc]init];
    UILabel *titleSecond = [[UILabel alloc]init];
    UIView *viewFirst    = [UIView new];
    UIView *viewSecond   = [UIView new];
    
    //attributs
    titleFirst.text              = @"植物养护";
    titleSecond.text             = @"植物简介";
    titleFirst.textColor         = [UIColor lightGrayColor];
    titleSecond.textColor        = [UIColor lightGrayColor];
    [titleFirst sizeToFit];
    [titleSecond sizeToFit];
    
    viewFirst.layer.borderColor   = [[UIColor colorWithWhite:0.521 alpha:1.000] CGColor];
    viewSecond.layer.borderColor  = [[UIColor colorWithWhite:0.521 alpha:1.000] CGColor];
    viewFirst.layer.borderWidth   = 1;
    viewSecond.layer.borderWidth  = 1;
    viewFirst.layer.cornerRadius  = 5;
    viewSecond.layer.cornerRadius = 5;
    
    viewFirst.clipsToBounds = YES;
    viewSecond.clipsToBounds = YES;
    
    [self.view addSubview:titleFirst];
    [self.view addSubview:titleSecond];
    [self.view addSubview:viewFirst];
    [self.view addSubview:viewSecond];
    
    //添加约束
    [titleFirst mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.top.equalTo(plantImg.mas_bottom).offset(25);
    }];
    
    [viewFirst mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.right.equalTo(weakSelf.view.mas_right).offset(-10);
        make.height.equalTo(viewSecond);
        make.bottom.equalTo(titleSecond.mas_top).offset(-20);
        make.top.equalTo(titleFirst.mas_bottom).offset(10);
        
    }];
    
    [titleSecond mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.top.equalTo(viewFirst.mas_bottom).offset(20);
    }];
    
    [viewSecond mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.right.equalTo(weakSelf.view.mas_right).offset(-10);
        make.height.equalTo(viewFirst);
        make.top.equalTo(titleSecond.mas_bottom).offset(10);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-20);
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
