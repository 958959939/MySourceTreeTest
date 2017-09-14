//
//  HomeViewController.h
//  HanziDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) UIView *topView;

@property(retain,nonatomic)UILabel *searchType;//显示是笔画检索还是拼音检索的lable

@property(retain,nonatomic)UITextField *inputText;//输入汉字，拼音，或笔画数检索的输入框

//放拼音 或者 笔画 用于选择的检索框
@property(retain,nonatomic)UIView *indexView;
@property(retain,nonatomic)UIView *bsIndexView;


@end
