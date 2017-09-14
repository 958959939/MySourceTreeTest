//
//  FeedbackViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "FeedbackViewController.h"
#import "MoreViewController.h"
@interface FeedbackViewController ()

@end

@implementation FeedbackViewController
@synthesize topLabel,bel1,bel2,backButton,searchButton,text1,text2,text3,view1,view2,view3,btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9,btn10,btn11,btn12,tool,ba1,pview,pview1;
-(void)dealloc
{
    self.topLabel=nil;
    self.bel1=nil;
    self.bel2=nil;
    self.text1=nil;
    self.text2=nil;
    self.text3=nil;
    self.view1=nil;
    self.view2=nil;
    self.view3=nil;
    self.tool=nil;
    self.ba1=nil;
    self.pview=nil;
    self.pview1=nil;
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //导航栏
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.topLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, -0.5, 320, 44)];
    self.topLabel.text=@"意见反馈";
    self.topLabel.font=[UIFont systemFontOfSize:23];
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    self.topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    self.topLabel.userInteractionEnabled=YES;
    self.topLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:self.topLabel];
    //返回button
     self.backButton=[[UIButton alloc]initWithFrame:CGRectMake(20, (44-21)/2, 22, 21)];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.topLabel addSubview:self.backButton];
    
    //搜索btton
    self.searchButton=[[UIButton alloc]initWithFrame:CGRectMake(282,(44-18)/2, 17, 18)];
    self.searchButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"magnifier.png"]];
    [self.topLabel addSubview:self.searchButton];
    [self.searchButton addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    
    //中间用线隔开
    UILabel *left=[[UILabel alloc]initWithFrame:CGRectMake(60, 1, 1, 44)];
    left.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:left];
    [left release];
    
    UILabel *right=[[UILabel alloc]initWithFrame:CGRectMake(260, 1, 1, 44)];
    right.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:right];
    [right release];
   
    //设置背景图片
    self.view1=[[UIImageView alloc]initWithFrame:CGRectMake(10, 50, 300, 360)];
    self.view1.image=[UIImage imageNamed:@"Key-frame2.png"];
    [self.view addSubview:self.view1];
    
    self.text1=[[UITextField alloc]initWithFrame:CGRectMake(20, 60, 300, 40)];
    self.text1.placeholder=@"请输入您的反馈意见 . . .";
    self.text1.adjustsFontSizeToFitWidth=YES;
    self.text1.clearsOnBeginEditing=NO;
    self.text1.textColor=[UIColor colorWithRed:110/255.0 green:10/255.0 blue:10/255.0 alpha:1];
    self.text1.backgroundColor=[UIColor clearColor];
    self.text1.font=[UIFont systemFontOfSize:12];
    self.text1.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:self.text1];
     //创建工具栏
    self.tool=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 33)];
    self.ba1=[[UIBarButtonItem alloc]initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(hui:)];
    NSArray *itArray=[NSArray arrayWithObject:self.ba1];
    self.tool.items=itArray;
    [self.tool setBarStyle:UIBarStyleBlackOpaque];
    self.text1.inputAccessoryView=tool;
    
    //设置性别背景图片
    self.view2=[[UIImageView alloc]initWithFrame:CGRectMake(15, 420, 70, 30)];
    self.view2.image=[UIImage imageNamed:@"pressed2.png"];
    [self.view addSubview:self.view2];
    
    self.text2=[[UILabel alloc]initWithFrame:CGRectMake(20, 425, 60, 20)];
    self.text2.text=@"男";
    self.text2.textColor=[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1];
    self.text2.backgroundColor=[UIColor clearColor];
    self.text2.font=[UIFont systemFontOfSize:14];
    self.text2.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:self.text2];
    
    
    //设置年龄背景图片
    self.view3=[[UIImageView alloc]initWithFrame:CGRectMake(100, 420, 70, 30)];
    self.view3.image=[UIImage imageNamed:@"pressed2.png"];
    [self.view addSubview:self.view3];
    
    self.text3=[[UILabel alloc]initWithFrame:CGRectMake(105, 425, 60, 20)];
    self.text3.text=@"年龄";
    self.text3.textColor=[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1];
    self.text3.backgroundColor=[UIColor clearColor];
    self.text3.font=[UIFont systemFontOfSize:14];
    self.text3.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:self.text3];
    
    //提交按钮
    self.btn1=[[UIButton alloc]initWithFrame:CGRectMake(250,420, 50, 25)];
    self.btn1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pressed1.png"]];
    [self.view addSubview:self.btn1];
    [self.btn1 setTitle:@"提交" forState:UIControlStateNormal];
    [self.btn1 addTarget:self action:@selector(tijiao:) forControlEvents:UIControlEventTouchUpInside];
	
    //性别按钮
    self.btn2=[[UIButton alloc]initWithFrame:CGRectMake(70,430, 10, 10)];
    self.btn2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"downward.png"]];
    [self.btn2 addTarget:self action:@selector(sex:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn2];
    //年龄按钮
    self.btn3=[[UIButton alloc]initWithFrame:CGRectMake(155,430, 10, 10)];
    self.btn3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"downward.png"]];
    [self.btn3 addTarget:self action:@selector(age:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn3];
    
    //设置性别view
//    self.pview=[[UIView alloc]initWithFrame:CGRectMake(20,370, 60, 50)];
    self.pview=[[UIView alloc]initWithFrame:CGRectMake(20,370, 60, 50)];
    self.pview.backgroundColor=[UIColor whiteColor];
    self.pview.hidden=YES;
    [self.view addSubview:self.pview];

    self.btn4=[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn4.frame=CGRectMake(0, 0, 60, 25) ;
    [self.btn4  setTitle:@"男" forState:UIControlStateNormal];
    [self.btn4 setTitleColor:[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1] forState:UIControlStateNormal];
    [self.btn4 addTarget:self action:@selector(nan:) forControlEvents:UIControlEventTouchUpInside];
    [self.pview addSubview:self.btn4];
    
    self.btn5=[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn5.frame=CGRectMake(0, 25, 60, 25) ;
    [self.btn5  setTitle:@"女" forState:UIControlStateNormal];
    [self.btn5 setTitleColor:[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1] forState:UIControlStateNormal];
    [self.btn5 addTarget:self action:@selector(nv:) forControlEvents:UIControlEventTouchUpInside];
    [self.pview addSubview:self.btn5];
    
    //设置年龄view
    self.pview1=[[UIView alloc]initWithFrame:CGRectMake(105,280, 60, 140)];
    self.pview1.backgroundColor=[UIColor whiteColor];
    self.pview1.hidden=YES;//隐藏
    [self.view addSubview:self.pview1];
    self.btn6=[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn6.frame=CGRectMake(0, 5, 60, 20) ;
    [self.btn6  setTitle:@"年龄" forState:UIControlStateNormal];
    [self.btn6 setTitleColor:[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1] forState:UIControlStateNormal];
    [self.btn6 addTarget:self action:@selector(nanling:) forControlEvents:UIControlEventTouchUpInside];
    [self.pview1 addSubview:self.btn6];
    
    self.btn7=[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn7.frame=CGRectMake(0, 23, 60, 20) ;
    [self.btn7  setTitle:@"<18" forState:UIControlStateNormal];
    [self.btn7 setTitleColor:[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1] forState:UIControlStateNormal];
    [self.btn7 addTarget:self action:@selector(xiaoyu18:) forControlEvents:UIControlEventTouchUpInside];
    [self.pview1 addSubview:self.btn7];
    
    self.btn8=[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn8.frame=CGRectMake(0, 43, 60, 20) ;
    [self.btn8  setTitle:@"18~25" forState:UIControlStateNormal];
    [self.btn8 setTitleColor:[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1] forState:UIControlStateNormal];
    [self.btn8 addTarget:self action:@selector(shiba:) forControlEvents:UIControlEventTouchUpInside];
    [self.pview1 addSubview:self.btn8];
    
    btn9=[UIButton buttonWithType:UIButtonTypeCustom];
    btn9.frame=CGRectMake(0, 63, 60, 20) ;
    [btn9  setTitle:@"25~35" forState:UIControlStateNormal];
    [btn9 setTitleColor:[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1] forState:UIControlStateNormal];
    [btn9 addTarget:self action:@selector(erwu:) forControlEvents:UIControlEventTouchUpInside];
    [pview1 addSubview:btn9];
    
    btn10=[UIButton buttonWithType:UIButtonTypeCustom];
    btn10.frame=CGRectMake(0, 83, 60, 20) ;
    [btn10  setTitle:@"35~45" forState:UIControlStateNormal];
    [btn10 setTitleColor:[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1] forState:UIControlStateNormal];
    [btn10 addTarget:self action:@selector(sanwu:) forControlEvents:UIControlEventTouchUpInside];
    [pview1 addSubview:btn10];
    
    btn11=[UIButton buttonWithType:UIButtonTypeCustom];
    btn11.frame=CGRectMake(0, 103, 60, 20) ;
    [btn11  setTitle:@"45~50" forState:UIControlStateNormal];
    [btn11 setTitleColor:[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1] forState:UIControlStateNormal];
    [btn11 addTarget:self action:@selector(siwu:) forControlEvents:UIControlEventTouchUpInside];
    [pview1 addSubview:btn11];
    
    btn12=[UIButton buttonWithType:UIButtonTypeCustom];
    btn12.frame=CGRectMake(0, 123, 60, 20) ;
    [btn12  setTitle:@">50" forState:UIControlStateNormal];
    [btn12 setTitleColor:[UIColor colorWithRed:100/255.0 green:10/255.0 blue:10/255.0 alpha:1] forState:UIControlStateNormal];
    [btn12 addTarget:self action:@selector(wushi:) forControlEvents:UIControlEventTouchUpInside];
    [pview1 addSubview:btn12];
    
}

//返回按钮
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)search:(id)sender
{
    NSLog(@"搜索");
}
//缩回键盘
-(void)hui:(id)sender
{
    [text1 resignFirstResponder];//第一时间响应，使他缩回去
}

//点击事件
-(void)tijiao:(id)sender
{
    NSLog(@"提交");
    
}
//性别
-(void)sex:(id)sender
{
  pview.hidden=NO;
   
}
//年龄
-(void)age:(id)sender
{
   pview1.hidden=NO;
}
//男
-(void)nan:(id)sender
{
    btn4.backgroundColor=[UIColor blueColor];
    btn5.backgroundColor=[UIColor clearColor];
    text2.text=@"男";
    pview.hidden=YES;
  
}
//女
-(void)nv:(id)sender
{
    btn5.backgroundColor=[UIColor blueColor];
    btn4.backgroundColor=[UIColor clearColor];
    text2.text=@"女";
    pview.hidden=YES;
}
-(void)nanling:(id)sender
{
    btn6.backgroundColor=[UIColor blueColor];
    btn7.backgroundColor=[UIColor clearColor];
    btn8.backgroundColor=[UIColor clearColor];
    btn9.backgroundColor=[UIColor clearColor];
    btn10.backgroundColor=[UIColor clearColor];
    btn11.backgroundColor=[UIColor clearColor];
    btn12.backgroundColor=[UIColor clearColor];
    text3.text=@"年龄";
    pview1.hidden=YES;
}
-(void)xiaoyu18:(id)sender
{
    btn7.backgroundColor=[UIColor blueColor];
    btn6.backgroundColor=[UIColor clearColor];
    btn8.backgroundColor=[UIColor clearColor];
    btn9.backgroundColor=[UIColor clearColor];
    btn10.backgroundColor=[UIColor clearColor];
    btn11.backgroundColor=[UIColor clearColor];
    btn12.backgroundColor=[UIColor clearColor];
    text3.text=@"<18";
    pview1.hidden=YES;
}
-(void)shiba:(id)sender
{
    btn8.backgroundColor=[UIColor blueColor];
    btn12.backgroundColor=[UIColor clearColor];
    btn6.backgroundColor=[UIColor clearColor];
    btn7.backgroundColor=[UIColor clearColor];
    btn9.backgroundColor=[UIColor clearColor];
    btn10.backgroundColor=[UIColor clearColor];
    btn11.backgroundColor=[UIColor clearColor];
    text3.text=@"18~25";
    pview1.hidden=YES;
}
-(void)erwu:(id)sender
{
    btn9.backgroundColor=[UIColor blueColor];
    btn12.backgroundColor=[UIColor clearColor];
    btn6.backgroundColor=[UIColor clearColor];
    btn7.backgroundColor=[UIColor clearColor];
    btn8.backgroundColor=[UIColor clearColor];
    btn10.backgroundColor=[UIColor clearColor];
    btn11.backgroundColor=[UIColor clearColor];
    text3.text=@"25~35";
    pview1.hidden=YES;
}
-(void)sanwu:(id)sender
{
    btn10.backgroundColor=[UIColor blueColor];
    btn12.backgroundColor=[UIColor clearColor];
    btn6.backgroundColor=[UIColor clearColor];
    btn7.backgroundColor=[UIColor clearColor];
    btn8.backgroundColor=[UIColor clearColor];
    btn9.backgroundColor=[UIColor clearColor];
    btn11.backgroundColor=[UIColor clearColor];
    text3.text=@"35~45";
    pview1.hidden=YES;
}
-(void)siwu:(id)sender
{
    btn11.backgroundColor=[UIColor blueColor];
    btn12.backgroundColor=[UIColor clearColor];
    btn6.backgroundColor=[UIColor clearColor];
    btn7.backgroundColor=[UIColor clearColor];
    btn8.backgroundColor=[UIColor clearColor];
    btn9.backgroundColor=[UIColor clearColor];
    btn10.backgroundColor=[UIColor clearColor];
    text3.text=@"45~50";
    pview1.hidden=YES;
}
-(void)wushi:(id)sender
{
    btn12.backgroundColor=[UIColor blueColor];
    btn11.backgroundColor=[UIColor clearColor];
    btn6.backgroundColor=[UIColor clearColor];
    btn7.backgroundColor=[UIColor clearColor];
    btn8.backgroundColor=[UIColor clearColor];
    btn9.backgroundColor=[UIColor clearColor];
    btn10.backgroundColor=[UIColor clearColor];
    text3.text=@">50";
    pview1.hidden=YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
