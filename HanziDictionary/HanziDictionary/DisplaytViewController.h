//
//  SearchResultViewController.h
//  HanziDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayInfoManager.h"


@interface DisplaytViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DisplayInfoManagerProtocol>

@property (retain, nonatomic) UIView *topView;
@property (retain,nonatomic)NSString *topTitel;
@property(retain,nonatomic)UITableView *tbView;

@property(retain,nonatomic)NSMutableArray *showArray;
@end
