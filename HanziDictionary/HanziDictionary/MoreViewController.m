//
//  MoreViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MoreViewController.h"

#import "FeedbackViewController.h"

#import "UsViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController
@synthesize topLabel,backButton,view1,bel1,bel2,bel3,bel4,bel5,bel6,bel7;
-(void)dealloc
{
    self.topLabel=nil;
    self.backButton=nil;
    self.view1=nil;
    self.bel1=nil;
    self.bel2=nil;
    self.bel3=nil;
    self.bel4=nil;
    self.bel5=nil;
    self.bel6=nil;
    self.bel7=nil;
    [super dealloc];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //导航栏
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    topLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, -0.5, 320, 44)];
    self.topLabel.text=@"汉语字典";
    self.topLabel.font=[UIFont systemFontOfSize:23];
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    self.topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    self.topLabel.userInteractionEnabled=YES;
    self.topLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:self.topLabel];
    //返回button
     backButton=[[UIButton alloc]initWithFrame:CGRectMake(20, (44-21)/2, 22, 21)];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.topLabel addSubview:self.backButton];
    
    //中间用线隔开
    UILabel *left=[[UILabel alloc]initWithFrame:CGRectMake(60, 1, 1, 44)];
    left.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:left];
    [left release];
    
    //我的收藏
    bel1=[[UILabel alloc]initWithFrame:CGRectMake(20, 60, 300, 40)];
    self.bel1.text=@"我的收藏";
    self.bel1.textColor=[UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    self.bel1.backgroundColor=[UIColor clearColor];
    self.bel1.textAlignment=NSTextAlignmentLeft;
    self.bel1.font=[UIFont systemFontOfSize:25];
    [self.view addSubview:self.bel1];
    //搜藏按钮
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(280, 65, 25, 25) ;
    [btn  setBackgroundImage:[UIImage imageNamed:@"continue@2x.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(shouchang:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    //设置横线
    view1=[[UIImageView alloc]initWithFrame:CGRectMake(15, 95, 290, 1)];
    self.view1.image=[UIImage imageNamed:@"dividing-line.png"];
    [self.view addSubview:self.view1];
    
    //分享
    bel2=[[UILabel alloc]initWithFrame:CGRectMake(20, 105, 300, 40)];
    self.bel2.text=@"分享";
    self.bel2.textColor=[UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    self.bel2.backgroundColor=[UIColor clearColor];
    self.bel2.textAlignment=NSTextAlignmentLeft;
    self.bel2.font=[UIFont systemFontOfSize:25];
    [self.view addSubview:self.bel2];
    //设置横线
    view1=[[UIImageView alloc]initWithFrame:CGRectMake(15, 140, 290, 1)];
    self.view1.image=[UIImage imageNamed:@"dividing-line.png"];
    [self.view addSubview:self.view1];
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(280, 110, 25, 25) ;
    [btn1  setBackgroundImage:[UIImage imageNamed:@"continue@2x.png"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(fenxiang:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    //意见反馈
    bel3=[[UILabel alloc]initWithFrame:CGRectMake(20, 150, 300, 40)];
    self.bel3.text=@"意见反馈";
    self.bel3.textColor=[UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    self.bel3.backgroundColor=[UIColor clearColor];
    self.bel3.textAlignment=NSTextAlignmentLeft;
    self.bel3.font=[UIFont systemFontOfSize:25];
    [self.view addSubview:self.bel3];
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake(280, 155, 25, 25) ;
    [btn2  setBackgroundImage:[UIImage imageNamed:@"continue@2x.png"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(fankui:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    //设置横线
    view1=[[UIImageView alloc]initWithFrame:CGRectMake(15, 185, 290, 1)];
    self.view1.image=[UIImage imageNamed:@"dividing-line.png"];
    [self.view addSubview:self.view1];
    
    bel4=[[UILabel alloc]initWithFrame:CGRectMake(20, 195, 300, 40)];
    self.bel4.text=@"精品应用";
    self.bel4.textColor=[UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    self.bel4.backgroundColor=[UIColor clearColor];
    self.bel4.textAlignment=NSTextAlignmentLeft;
    self.bel4.font=[UIFont systemFontOfSize:25];
    [self.view addSubview:self.bel4];
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame=CGRectMake(280, 200, 25, 25) ;
    [btn3  setBackgroundImage:[UIImage imageNamed:@"continue@2x.png"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(yingyong:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    //设置横线
    view1=[[UIImageView alloc]initWithFrame:CGRectMake(15, 230, 290, 1)];
    self.view1.image=[UIImage imageNamed:@"dividing-line.png"];
    [self.view addSubview:self.view1];
    
    //应用打分
    bel5=[[UILabel alloc]initWithFrame:CGRectMake(20, 240, 300, 40)];
    self.bel5.text=@"应用打分";
    self.bel5.textColor=[UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    self.bel5.backgroundColor=[UIColor clearColor];
    self.bel5.textAlignment=NSTextAlignmentLeft;
    self.bel5.font=[UIFont systemFontOfSize:25];
    [self.view addSubview:self.bel5];
    UIButton *btn4=[UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame=CGRectMake(280, 245, 25, 25) ;
    [btn4  setBackgroundImage:[UIImage imageNamed:@"continue@2x.png"] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(dafen:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    //设置横线
    view1=[[UIImageView alloc]initWithFrame:CGRectMake(15, 275, 290, 1)];
    self.view1.image=[UIImage imageNamed:@"dividing-line.png"];
    [self.view addSubview:self.view1];
    
    //关于我们
    bel6=[[UILabel alloc]initWithFrame:CGRectMake(20, 285, 300, 40)];
    self.bel6.text=@"关于我们";
    self.bel6.textColor=[UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    self.bel6.backgroundColor=[UIColor clearColor];
    self.bel6.textAlignment=NSTextAlignmentLeft;
    self.bel6.font=[UIFont systemFontOfSize:25];
    [self.view addSubview:self.bel6];
    UIButton *btn5=[UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame=CGRectMake(280, 290, 25, 25) ;
    [btn5  setBackgroundImage:[UIImage imageNamed:@"continue@2x.png"] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(guanyu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    //设置横线
    view1=[[UIImageView alloc]initWithFrame:CGRectMake(15, 320, 290, 1)];
    self.view1.image=[UIImage imageNamed:@"dividing-line.png"];
    [self.view addSubview:self.view1];
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
//    DetailViewController *de=[[DetailViewController alloc]init];
//    [self presentViewController:de animated:YES completion:nil];
}
-(void)shouchang:(id)sender
{
    NSLog(@"我的搜藏");
//    CollectionViewController *co=[[CollectionViewController alloc]init];
//    [self presentViewController:co animated:YES completion:nil];
    
}
-(void)fenxiang:(id)sender
{
    NSLog(@"分享");
}
-(void)fankui:(id)sender
{
    NSLog(@"意见反馈");
    FeedbackViewController *feedback=[[FeedbackViewController alloc]init];
    [self.navigationController pushViewController:feedback animated:YES];
    [feedback release];
}
-(void)yingyong:(id)sender
{
    NSLog(@"精品应用");
}
-(void)dafen:(id)sender
{
    NSLog(@"应用打分");
}
-(void)guanyu:(id)sender
{
    NSLog(@"关于我们");
    
    UsViewController *us=[[UsViewController alloc]init];
    [self.navigationController pushViewController:us animated:YES];
    [us release];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
    
    // Dispose of any resources that can be recreated.
}

@end
