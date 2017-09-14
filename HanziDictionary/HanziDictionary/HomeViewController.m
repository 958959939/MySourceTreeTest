//
//  HomeViewController.m
//  HanziDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "HomeViewController.h"
#import "CreatModel.h"
#import "PinyinViewController.h"
#import "RadicalSearchController.h"
#import "MoreViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize topView,searchType,inputText,indexView,bsIndexView;
-(void)dealloc{
    self.topView=nil;
    self.searchType=nil;
    self.indexView=nil;
    self.bsIndexView=nil;
    
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

-(void)pushToMoreController{
    MoreViewController *more=[[MoreViewController alloc]init];
    [self.navigationController pushViewController:more animated:YES];
    [more release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //背景颜色
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    //隐藏导航条
    self.navigationController.navigationBarHidden=YES;
    
    //自己创建类似导航条的view
    topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    topView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher"]];
    [self.view addSubview:topView];
    
    //title 汉语字典
    UILabel *title=[CreatModel createLableWithFrame:CGRectMake(0, 0, 320, 44)
                                         andContent:@"汉语字典"
                                            andfont:TITLEFONT
                                    andContentColor:[UIColor whiteColor]
                                 andBackgroundColor:[UIColor clearColor]
                                   andTextAlignment:NSTextAlignmentCenter];
    [topView addSubview:title];
    
    //竖直分割条
    UIImageView *topimg=[[UIImageView alloc]initWithFrame:CGRectMake(320-61, 0, 1, 44)];
    topimg.image=[UIImage imageNamed:@"top"];
    [topView addSubview:topimg];
    [topimg release];
    
    //more按钮
    UIButton *more=[UIButton buttonWithType:UIButtonTypeCustom];
    more.frame=CGRectMake(320-60+(60-23)/2, (44-5)/2, 23, 5);
    [more setBackgroundImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [more addTarget:self action:@selector(pushToMoreController) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:more];
    //---------------------------------------------------------
  /*
//    //拼音选择按钮 
//    UIButton *pyjzBtn=[CreatModel createButtonWithType:UIButtonTypeCustom
//                                              andFrame:CGRectMake(18, 44+10, 142, 33)
//                                      andNormalBgImage:[UIImage imageNamed:@"pyjz_normal"]
//                                   andHighLightedImage:[UIImage imageNamed:@"pyjz_pressed"]
//                                              andTitle:@"拼音检字"
//                                         andTitileFont:[UIFont systemFontOfSize:15]
//                                         andTitleColor:[UIColor blackColor]
//                                             andTarget:self
//                                             andAction:@selector(pyjz:)
//                                      andControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:pyjzBtn];
//
//    
//    //部首选择按钮
//     UIButton *bsjzBtn=[CreatModel createButtonWithType:UIButtonTypeCustom
//                                               andFrame:CGRectMake(160, 44+10, 142, 33)
//                                       andNormalBgImage:[UIImage imageNamed:@"fanyi"]
//                                    andHighLightedImage:[UIImage imageNamed:@"fanyi"]
//                                               andTitle:@"部首检字"
//                                          andTitileFont:[UIFont systemFontOfSize:15]
//                                          andTitleColor:[UIColor blackColor]
//                                              andTarget:self
//                                              andAction:@selector(bsjz:)
//                                       andControlEvents:UIControlEventTouchUpInside];
//
//    [self.view addSubview:bsjzBtn];
  */
    //---------------------------------------------------------
    //拼音检字和部首检字的选择框
    NSArray *colorArr=@[@"拼音检字",@"部首检字"];
    UISegmentedControl *segmentedControl=[[UISegmentedControl alloc]initWithItems:colorArr];
    segmentedControl.frame=CGRectMake(18, 44+10, 284, 33);
    segmentedControl.segmentedControlStyle=UISegmentedControlStyleBar;
    
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"pyjz_normal01"] forState:UIControlStateNormal barMetrics: UIBarMetricsDefault];
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed1"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

   //改变segment的字体颜色和大小
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor,[UIFont fontWithName:@"AppleGothic" size:14],UITextAttributeFont ,nil];
    [segmentedControl setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    //为segment添加响应事件
    [segmentedControl addTarget:self action:@selector(changejz:) forControlEvents:UIControlEventValueChanged];
    
    //默认选中拼音检字
    segmentedControl.selectedSegmentIndex=0;
    [self.view addSubview:segmentedControl];
    
    //---------------------------------------------------------

    
    //搜索框
    UIView *inputView=[[UIView alloc]initWithFrame:CGRectMake((320-287)/2, 44+10+33+10, 287, 30)];
    inputView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"input"]];
    inputText=[[UITextField alloc]initWithFrame:CGRectMake(10, 5, 287-15, 25)];
    inputText.placeholder=@"请输入...";
    //设置代理 用来取消输入框的第一响应
    inputText.delegate=self;
    //取消首字母自动大写
    inputText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    
    [inputView addSubview:inputText];
    [self.view addSubview:inputView];
    [inputView release];
    
    //---------------------------------------------------------
    
    //label 显示"最近搜索"
    CGFloat zuijinY=inputView.frame.origin.y+inputView.frame.size.height;
    UILabel *zuijin=[CreatModel createLableWithFrame:CGRectMake(18, zuijinY, 320, 30)
                                         andContent:@"最近搜索:"
                                             andfont:nil
//                     [UIFont systemFontOfSize:15]
                                    andContentColor:REDCOLOR
                                 andBackgroundColor:[UIColor clearColor]
                                   andTextAlignment:NSTextAlignmentLeft];
    [topView addSubview:zuijin];
    
    //分割线1
    UIImageView *fenge1=[[UIImageView alloc]initWithFrame:CGRectMake(18, zuijin.frame.origin.y+zuijin.frame.size.height, 320-18*2, 1)];
    fenge1.image=[UIImage imageNamed:@"dividing-line"];
    [self.view addSubview:fenge1];
    [fenge1 release];
    
    //显示最近搜索
    UILabel *zuijinSearch=[CreatModel createLableWithFrame:CGRectMake(18, fenge1.frame.origin.y+fenge1.frame.size.height+6, 320-18*2, 30)
                                                andContent:@"  哈  叶  年  啊  检  我  好  不  学  生"
                                                   andfont:nil
                                           andContentColor:REDCOLOR
                                        andBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Key-frame1"]]
                                          andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:zuijinSearch];
    
    //---------------------------------------------------------
    
    //搜索类型名字
    self.searchType=[CreatModel createLableWithFrame:CGRectMake(18, zuijinSearch.frame.origin.y+zuijinSearch.frame.size.height+6, 320-18*2, 30)
                                          andContent:@"按照拼音字母检索："
                                             andfont:nil
                                     andContentColor:REDCOLOR
                                  andBackgroundColor:[UIColor clearColor]
                                    andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:searchType];
    
    //分割线2
    UIImageView *fenge2=[[UIImageView alloc]initWithFrame:CGRectMake(18, searchType.frame.origin.y+searchType.frame.size.height+6, 320-18*2, 1)];
    fenge2.image=[UIImage imageNamed:@"dividing-line"];
    [self.view addSubview:fenge2];
    [fenge2 release];
    
    //-----------------------检索框-----------------------------
    CGFloat indexViewHeight=fenge2.frame.origin.y+fenge2.frame.size.height+6;
    //创建拼音检索框
    indexView=[[UIView alloc]initWithFrame:CGRectMake(18, indexViewHeight, 320-18*2, 480-indexViewHeight-20-15)];
    [indexView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Key-frame2"]]];
    [self.view addSubview:indexView];
    //默认选择拼音检字 
    for (int i=0; i<26; i++) {
        //将数字转换为ASCII码用于输出26个大写字母
        NSString *titleStr=[NSString stringWithFormat:@"%c",(char)(i+65)];
        
        //分别创建26个button
        UIButton *btn=[CreatModel createButtonWithType:0
                                              andFrame:CGRectMake(10+i%8*34, i/8*40+15, 30, 30)
                                      andNormalBgImage:nil
                                   andHighLightedImage:nil
                                              andTitle:titleStr
                                         andTitileFont:[UIFont systemFontOfSize:23]
                                         andTitleColor:REDCOLOR
                                             andTarget:self
                                             andAction:@selector(pushTopyjs:)
                                      andControlEvents:UIControlEventTouchUpInside];
        
        
        [indexView addSubview:btn];
    }

    //创建部首检索框 但是初始时使其隐藏
    bsIndexView=[[UIView alloc]initWithFrame:CGRectMake(18, indexViewHeight, 320-18*2, 480-indexViewHeight-20-15)];
    [bsIndexView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Key-frame2"]]];
    [self.view addSubview:bsIndexView];
    //显示17个数字按钮
    for (int i=0; i<17; i++) {
        //将数字转换为显示的字符串
        NSString *titleStr=[NSString stringWithFormat:@"%d",i+1];
        
        //循环生成17个button  添加到indexView视图上
        
        UIButton *btn=[CreatModel createButtonWithType:0
                                              andFrame:CGRectMake(8+i%7*40, i/7*50+20, 30, 30)
                                      andNormalBgImage:nil
                                   andHighLightedImage:nil
                                              andTitle:titleStr
                                         andTitileFont:[UIFont systemFontOfSize:23]
                                         andTitleColor:REDCOLOR
                                             andTarget:self
                                             andAction:@selector(pushTobsjs:)
                                      andControlEvents:UIControlEventTouchUpInside];
        
        [bsIndexView addSubview:btn];
    }
    //设置隐藏
    bsIndexView.hidden=YES;
    
}
-(void)changejz:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex==0) {
        
        //改为拼音检索 并 创建26个字母按钮
        [self pyjz:nil];
    }else{
        //改为部首检索 并 创建17个数字按钮
        [self bsjz:nil];
    }
    
}
//拼音检索
-(void)pyjz:(id)sender{
    self.searchType.text=@"按照拼音字母检索：";
    self.indexView.hidden=NO;
    self.bsIndexView.hidden=YES;

}
//部首检索
-(void)bsjz:(id)sender{
    self.searchType.text=@"按照部首笔画检索：";
    self.bsIndexView.hidden=NO;
    self.indexView.hidden=YES;    
}
-(void)pushTopyjs:(id)sender{
    NSLog(@"pushTopyjs");
    PinyinViewController *pinyin=[[PinyinViewController alloc]init];
    [self.navigationController pushViewController:pinyin animated:YES];
    [pinyin release];
    
}

-(void)pushTobsjs:(id)sender{
    NSLog(@"pushTobsjs");
    RadicalSearchController *radSer=[[RadicalSearchController alloc]init];
    
    [self.navigationController pushViewController:radSer animated:YES];
    
    [radSer release];
//    [radSer.tbView scrollRectToVisible:CGRectMake(0, 480-44-20+44*10, 320, 1) animated:NO];
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    //判断输入是否为单个汉字 ，数字，或全拼音
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
