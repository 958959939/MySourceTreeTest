//
//  PinyinViewController.h
//  HanziDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinyinViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (retain, nonatomic) UIView *topView;

@property (retain,nonatomic)UITableView *tbView;

@property(retain,nonatomic)NSArray *pinyinArray;//得到的pinyin对象array

@property(retain,nonatomic)NSMutableDictionary *pinyinDic;//把按pinyin首字母分为的数组放入字典中，关键字为拼音首字母

@property(retain,nonatomic)NSArray *allKeys;//bsDic字典的所有关键字

@end
