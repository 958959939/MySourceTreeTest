//
//  UsViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsViewController : UIViewController
@property (retain,nonatomic) UILabel *topLabel;
@property (retain,nonatomic) UIButton *backButton;//返回按钮

@property(retain,nonatomic)UIImageView *view1;
@property(retain,nonatomic)UILabel *middleText1;//中间文本框
@property(retain,nonatomic)UILabel *middleText2;//中间文本框
@property(retain,nonatomic)UIImageView *view2;//中间图片
@property(retain,nonatomic)UILabel *middleText3;//中间文本框字体
@property(retain,nonatomic)UILabel *middleText4;//最后文本框字体
@property(retain,nonatomic)UIImageView *view3;
@property(retain,nonatomic)UILabel *middleText6;
@property(retain,nonatomic)UILabel *middleText7;
@property(retain,nonatomic)UILabel *middleText8;
@end
