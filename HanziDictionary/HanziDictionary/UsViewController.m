//
//  UsViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "UsViewController.h"
#import "FeedbackViewController.h"
@interface UsViewController ()

@end

@implementation UsViewController
//内存管理（释放）
@synthesize    topLabel,backButton,view1,view2,view3,middleText1,middleText2,middleText3,middleText4,middleText6,middleText7,middleText8;

-(void)dealloc{
    self.topLabel=nil;
    self.backButton=nil;

    self.view1=nil;
    self.middleText1=nil;
    self.middleText2=nil;
    self.middleText3=nil;
    self.middleText4=nil;
    self.middleText6=nil;
    self.middleText7=nil;
    self.middleText8=nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //导航栏
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    topLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, -0.5, 320, 44)];
    topLabel.text=@"关于我们";
    topLabel.font=[UIFont systemFontOfSize:23];
    topLabel.textAlignment=NSTextAlignmentCenter;
    topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    topLabel.userInteractionEnabled=YES;
    topLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:self.topLabel];
    //返回button
    backButton=[[UIButton alloc]initWithFrame:CGRectMake(20, (44-21)/2, 22, 21)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [topLabel addSubview:backButton];
   
    
    //中间用线隔开
    UILabel *left=[[UILabel alloc]initWithFrame:CGRectMake(60, 1, 1, 44)];
    left.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:left];
    [left release];
    
    
    
    //设置z字
    view1=[[UIImageView alloc]initWithFrame:CGRectMake(30, 60, 320, 50)];
    self.view1.image=[UIImage imageNamed:@"z.png"];
    [self.view addSubview:self.view1];
    
    
    
    //定义文字
    middleText1=[[UILabel alloc]initWithFrame:CGRectMake(80, 60, 100, 40)];
    middleText1.text=[NSString stringWithFormat:@"指掌无线"];
    middleText1.textColor=[UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:1];
    middleText1.backgroundColor=[UIColor clearColor];
    middleText1.font=[UIFont systemFontOfSize:25];
    middleText1.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:self.middleText1];
    
    //定义文字
    middleText2=[[UILabel alloc]initWithFrame:CGRectMake(220, 110, 80, 40)];
    self.middleText2.text=@"汉语字典";
    self.middleText2.textColor=[UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:1];
    self.middleText2.backgroundColor=[UIColor clearColor];
    self.middleText2.font=[UIFont systemFontOfSize:16];
    self.middleText2.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:self.middleText2];
    
    
    //设置图片
    view2=[[UIImageView alloc]initWithFrame:CGRectMake(120, 150, 90, 100)];
    self.view2.image=[UIImage imageNamed:@"zidian@2x.png"];
    [self.view addSubview:self.view2];
    
    
   middleText3=[[UILabel alloc]initWithFrame:CGRectMake(40, 260, 250, 100)];
    self.middleText3.text=@"       汉语是世界上最精密的语言之一，语义丰富，耐人寻味。本词典篇幅简短，内容丰富，既求融科学性、知识性、实用性、规范性于一体，又注意突出时代特色。";
    self.middleText3.textColor=[UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:1];
    self.middleText3.backgroundColor=[UIColor clearColor];
    self.middleText3.numberOfLines=4;
    self.middleText3.lineBreakMode=UILineBreakModeCharacterWrap;
    self.middleText3.font=[UIFont systemFontOfSize:12];
    self.middleText3.adjustsLetterSpacingToFitWidth=YES;//字体适应宽度
    self.middleText3.adjustsFontSizeToFitWidth=YES;
    self.middleText3.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:self.middleText3];
    
    //设置虚线背景图片
    view3=[[UIImageView alloc]initWithFrame:CGRectMake(50, 360, 230, 80)];
    self.view3.image=[UIImage imageNamed:@"kuang.png"];
    [self.view addSubview:self.view3];
    
    middleText6=[[UILabel alloc]initWithFrame:CGRectMake(65, 360, 250, 40)];
    self.middleText6.text=@"官方网站: www.zhizhang.com";
    self.middleText6.textColor=[UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:1];
    self.middleText6.backgroundColor=[UIColor clearColor];
    self.middleText6.numberOfLines=1;
    self.middleText6.font=[UIFont systemFontOfSize:12];
    self.middleText6.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:self.middleText6];
    
    middleText7=[[UILabel alloc]initWithFrame:CGRectMake(65, 380, 250, 40)];
    self.middleText7.text=@"官方微博: e.weibo.com/u/3385145102";
    self.middleText7.textColor=[UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:1];
    self.middleText7.backgroundColor=[UIColor clearColor];
    self.middleText7.numberOfLines=1;
    self.middleText7.font=[UIFont systemFontOfSize:12];
    self.middleText7.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:self.middleText7];
    
    middleText8=[[UILabel alloc]initWithFrame:CGRectMake(65, 400, 250, 40)];
    self.middleText8.text=@"微信公共账号: 指掌无线";
    self.middleText8.textColor=[UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:1];
    self.middleText8.backgroundColor=[UIColor clearColor];
    self.middleText8.numberOfLines=1;
    self.middleText8.font=[UIFont systemFontOfSize:12];
    self.middleText8.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:self.middleText8];
	
}

-(void)back:(id)sender
{
   
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
