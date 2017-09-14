//
//  detailViewController.h
//  ChineseDictionaryXGS
//
//  Created by 努力+坚持+加油 on 13-6-22.
//  Copyright (c) 2013年 许根水. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailInfoManager.h"

@interface DetailViewController : UIViewController<NSURLConnectionDataDelegate,DetailInfoManagerProtocol,UITextViewDelegate,UIAlertViewDelegate>

@property(retain,nonatomic)UIView *topView;

@property(retain,nonatomic)NSMutableData *final;
@property(retain,nonatomic)NSString *duyinString;

@property(retain,nonatomic)UILabel *pinyin;
@property(retain,nonatomic)UILabel *fanti;
@property(retain,nonatomic)UILabel *busou;
@property(retain,nonatomic)UILabel *bishun;
@property(retain,nonatomic)UILabel *zhuyin;
@property(retain,nonatomic)UILabel *jiegou;
@property(retain,nonatomic)UILabel *bsbihua;
@property(retain,nonatomic)UILabel *zongbihua;
@property(retain,nonatomic)UILabel *ziti;
@property(retain,nonatomic)UILabel *jibenlable;

@property(retain,nonatomic)NSString *hanyustring;
@property(retain,nonatomic)NSString *basestring;
@property(retain,nonatomic)NSString *englishstring;
@property(retain,nonatomic)NSString *idiomstring;
@property(retain,nonatomic)NSString *hanzi;//属性参数汉字


@property(retain,nonatomic)UIView *shufaView;
@property(retain,nonatomic)UIView *fuzhiView;
@property(retain,nonatomic)UIView *shouchangView;
@property(retain,nonatomic)UIView *fenxiangView;
@property(retain,nonatomic)UIView *view2;//显示内容的view（基本信息，成语、、、、、、）

@property(retain,nonatomic)UITextView *textview;
@property(retain,nonatomic)NSMutableArray *jibenArray;

//回收键盘
@property(retain,nonatomic)UIToolbar *tool;
@property(retain,nonatomic)UIBarButtonItem *ba1;

@end
