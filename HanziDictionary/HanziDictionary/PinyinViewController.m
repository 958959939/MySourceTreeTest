//
//  PinyinViewController.m
//  HanziDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "PinyinViewController.h"
#import "ConnectionDB.h"
#import "Pinyin.h"
#import "CreatModel.h"
#import "DisplaytViewController.h"
@interface PinyinViewController ()

@end

@implementation PinyinViewController
@synthesize pinyinArray,tbView,pinyinDic,allKeys,topView;
-(void)dealloc{
    self.tbView=nil;
    self.pinyinArray=nil;
    self.pinyinDic=nil;
    self.allKeys=nil;
    self.topView=nil;
    
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)popBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	//自己创建类似导航条的view
    topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    topView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher"]];
    [self.view addSubview:topView];
    
    //title 汉语字典
    UILabel *title=[CreatModel createLableWithFrame:CGRectMake(0, 0, 320, 44)
                                         andContent:@"拼音检字"
                                            andfont:TITLEFONT
                                    andContentColor:[UIColor whiteColor]
                                 andBackgroundColor:[UIColor clearColor]
                                   andTextAlignment:NSTextAlignmentCenter];
    [topView addSubview:title];
    
    //左竖直分割条
    UIImageView *lefttopimg=[[UIImageView alloc]initWithFrame:CGRectMake(61, 0, 1, 44)];
    lefttopimg.image=[UIImage imageNamed:@"top"];
    [topView addSubview:lefttopimg];
    [lefttopimg release];
    
    //    UIImageView *leftImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 22, 21)];
    //    leftImageView.image=[UIImage imageNamed:@"return"];
    //
    
    //返回按钮
    UIButton *leftBtn=[UIButton buttonWithType:0];
    leftBtn.frame=CGRectMake((60-22)/2, (44-21)/2, 22, 21);//22 21
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(popBack:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:leftBtn];
    

    //------------------------------------------------------------
    //得到所有的拼音对象存入数组bsArray中
    self.pinyinArray=[Pinyin findAll];
    
    //初始化存储部首数组的字典
    pinyinDic=[[NSMutableDictionary alloc]init];
    
    //创建数组allKeys，用作字典的关键字
    self.allKeys=@[@"A",@"B",@"C",@"D",@"E",
                   @"F",@"G",@"H",@"I",@"G",
                   @"K",@"L",@"M",@"N",@"O",
                   @"P",@"Q",@"R",@"S",@"T"
                   ,@"U",@"V",@"W",@"X",@"Y"
                   ,@"Z"];
    
//  
//    for (int i=1; i<=26; i++) {
//        
//        NSMutableArray *bsArrayWithbihua=[[NSMutableArray alloc]init];
//        
//        for (int j=0; j<pinyinArray.count; j++) {
//            
//            Pinyin *py=pinyinArray[j];
//            
//          
//       
//            
//        }
//      
//        [self.pinyinDic setValue:bsArrayWithbihua forKey:[NSString stringWithFormat:@"%@",self.allKeys[i-1]]];
//    }
    
//    //创建单元格
//    tbView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 480-44-20)];
//    [self.view addSubview:self.tbView];
//    //让单元格实现两个代理协议
//    self.tbView.dataSource=self;
//    self.tbView.delegate=self;
//    [self.view addSubview:tbView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
