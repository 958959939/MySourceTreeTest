//
//  detailViewController.m
//  ChineseDictionaryXGS
//
//  Created by 努力+坚持+加油 on 13-6-22.
//  Copyright (c) 2013年 许根水. All rights reserved.
//

#import "DetailViewController.h"
#import "CreatModel.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import "DetailInfoManager.h"
#import "Detailnfo.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize topView,pinyin,fanti,busou,bishun,zhuyin,jiegou,bsbihua,zongbihua,ziti,duyinString,shufaView,fuzhiView,shouchangView,fenxiangView,textview,jibenArray,hanyustring,basestring,englishstring,idiomstring,jibenlable,hanzi,view2;

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

-(void)popToHome:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    //------------------------------------------------------------
    //自己创建类似导航条的view
    topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    topView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher"]];
    [self.view addSubview:topView];
    
    //title 汉语字典
    UILabel *title=[CreatModel createLableWithFrame:CGRectMake(0, 0, 320, 44)
                                         andContent:@"部首检字"
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
    
    //返回按钮
    UIButton *leftBtn=[UIButton buttonWithType:0];
    leftBtn.frame=CGRectMake((60-22)/2, (44-21)/2, 22, 21);//22 21
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(popBack:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:leftBtn];
    
    //右竖直分割条
    UIImageView *righttopimg=[[UIImageView alloc]initWithFrame:CGRectMake(320-61, 0, 1, 44)];
    righttopimg.image=[UIImage imageNamed:@"top"];
    [topView addSubview:righttopimg];
    [righttopimg release];
    
    //home按钮
    UIButton *rightBtn=[UIButton buttonWithType:0];
    rightBtn.frame=CGRectMake(320-60+(60-17)/2, (44-18)/2, 17, 18);//17 18
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(popToHome:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:rightBtn];
    
    

    
    
    //------------------------------------------------------------
    /*
    //设置navigationnavigationItem
    UIView *rightView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    
    UIButton *jiange=[[UIButton alloc]initWithFrame:CGRectMake(50, 1, 1, 44)];
    [jiange setBackgroundImage:[UIImage imageNamed:@"top.png"] forState:UIControlStateNormal];
    [rightView addSubview:jiange];
    
    UIButton *rightBtn2=[[UIButton alloc]initWithFrame:CGRectMake(70,13, 17, 18)];
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    [rightBtn2 addTarget:self action:@selector(rightgo) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:rightBtn2];
    self.navigationItem.rightBarButtonItem=[[[UIBarButtonItem alloc] initWithCustomView:rightView ]autorelease];
    
    [rightView release];
    [jiange release];
    [rightBtn2 release];
    
    
    UIView *leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    UIButton *jiange2=[[UIButton alloc]initWithFrame:CGRectMake(52, 1, 1, 44)];
    [jiange2 setBackgroundImage:[UIImage imageNamed:@"top.png"] forState:UIControlStateNormal];
    [leftView addSubview:jiange2];
    UIButton *leftbtn=[[UIButton alloc]initWithFrame:CGRectMake(15,10, 22, 21)];
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];
    [leftbtn addTarget:self action:@selector(leftgo) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:leftbtn];
    self.navigationItem.leftBarButtonItem=[[[UIBarButtonItem alloc] initWithCustomView:leftView]autorelease];
    [leftView release];
    [jiange2 release];
    [leftbtn release];
*/
    //----------------------------------------------
    self.pinyin=[CreatModel createLableWithFrame:CGRectMake(70, 18+44, 95, 15) andTitle:@"拼音" andsubtitle:@"xu" andfont:[UIFont systemFontOfSize:14] andContentColor:[UIColor redColor] andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:self.pinyin];
    
    self.zhuyin=[CreatModel createLableWithFrame:CGRectMake(70+100+5, 20+44, 95, 15) andTitle:@"注音" andsubtitle:@"^^" andfont:[UIFont systemFontOfSize:14] andContentColor:[UIColor redColor] andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:zhuyin];
    
    self.fanti=[CreatModel createLableWithFrame:CGRectMake(70, 18+20+44, 95, 15) andTitle:@"繁体" andsubtitle:@"許" andfont:[UIFont systemFontOfSize:14] andContentColor:[UIColor redColor] andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:fanti];
    
    self.jiegou=[CreatModel createLableWithFrame:CGRectMake(70+100+5, 18+20+44, 95, 15) andTitle:@"结构" andsubtitle:@"单一" andfont:[UIFont systemFontOfSize:14] andContentColor:[UIColor redColor] andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:jiegou];
    
    self.busou=[CreatModel createLableWithFrame:CGRectMake(70, 18+20+20+44, 95, 15) andTitle:@"部首" andsubtitle:@"讠" andfont:[UIFont systemFontOfSize:14] andContentColor:[UIColor redColor] andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:busou];
    
    self.bsbihua=[CreatModel createLableWithFrame:CGRectMake(70+100+60+5, 18+20+20+44, 95, 15) andTitle:@"部首笔画" andsubtitle:@"2" andfont:[UIFont systemFontOfSize:14] andContentColor:[UIColor redColor] andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:bsbihua];
    
    self.zongbihua=[CreatModel createLableWithFrame:CGRectMake(70+100+5,18+20+20+44, 95, 15) andTitle:@"笔画" andsubtitle:@"6" andfont:[UIFont systemFontOfSize:14] andContentColor:[UIColor redColor] andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:zongbihua];
    
    self.bishun=[CreatModel createLableWithFrame:CGRectMake(70, 18+20+20+20+44, 95, 15) andTitle:@"笔顺" andsubtitle:@"…………" andfont:[UIFont systemFontOfSize:14] andContentColor:[UIColor redColor] andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:bishun];
    
    ziti=[[UILabel alloc]initWithFrame:CGRectMake(5, 5+44, 60, 61)];
    ziti.text=@"许";
    ziti.font=[UIFont systemFontOfSize:50];
    ziti.textAlignment=NSTextAlignmentCenter;
    [ziti setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"banmizige"]]];
    [self.view addSubview:ziti];
    //设置title
    self.title=ziti.text;
    //设置读音两个button
    UIButton *pybtn=[UIButton buttonWithType:1];
    pybtn.frame=CGRectMake(70+70+5+2, 14+44, 25, 23);
    [pybtn setBackgroundImage:[UIImage imageNamed:@"loud"] forState:UIControlStateNormal];
    [pybtn addTarget:self action:@selector(pybtngo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pybtn];
    
    UIButton *zybtn=[UIButton buttonWithType:1];
    zybtn.frame=CGRectMake(70+70+100, 14+44, 25, 23);
    [zybtn setBackgroundImage:[UIImage imageNamed:@"loud"] forState:UIControlStateNormal];
    [zybtn addTarget:self action:@selector(pybtngo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zybtn];
//-----------------------------------------------------------------------
    DetailInfoManager *det=[[DetailInfoManager alloc]init];
    det.delegate=self;
    
    [det downDetailInfoWithHanZi:hanzi];
    
    
    NSArray *colorArr=@[@"基本信息",@"汉语字典",@"组词成语",@"英文翻译"];
    UISegmentedControl *segmentedControl=[[UISegmentedControl alloc]initWithItems:colorArr];
    segmentedControl.frame=CGRectMake(5, 20+20+20+20+23+44, 310, 40);
    segmentedControl.segmentedControlStyle=UISegmentedControlStyleBar;
    //设置初始化与点击之后的背景图片
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"pyjz_normal01"] forState:UIControlStateNormal barMetrics: UIBarMetricsDefault];
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed1"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
//    [segmentedControl setImage:[UIImage imageNamed:@"pyjz_pressed"] forSegmentAtIndex:3];//给某个负一张图片（会遮盖图片）
//    [segmentedControl setTitle:@"two" forSegmentAtIndex:3];//设置指定索引的题目
    
    //设置字体
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor,[UIFont fontWithName:@"AppleGothic" size:16],UITextAttributeFont ,nil];
    [segmentedControl setTitleTextAttributes:dic forState:UIControlStateNormal];
    //设置宽度
    
    //设置点击事件
    [segmentedControl addTarget:self action:@selector(jiben:) forControlEvents:UIControlEventValueChanged];;
    [self.view addSubview:segmentedControl];
    
    //设置显示的内容
    view2=[[UIView alloc]initWithFrame:CGRectMake(5, 150+44, 316,242)];
    view2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"informatianlow2"]];
    [self.view addSubview:view2];
    //设置回形针的
    UIView *view3=[[UIView alloc]initWithFrame:CGRectMake(271, 138+44, 35,54)];
    view3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"brooch"]];
    [self.view addSubview:view3];
    
    //设置textview
    textview=[[UITextView alloc]initWithFrame:CGRectMake(12, 30, 290, 212)];
//    textview.backgroundColor=[UIColor redColor];
    textview.text=@"空";
//    textview.userInteractionEnabled=NO;
    [view2 addSubview:textview];
    //回收键盘
    self.tool=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 33)];
    self.ba1=[[UIBarButtonItem alloc]initWithTitle:@"down" style:UIBarButtonItemStyleDone target:self action:@selector(hui:)];
    NSArray *itArray=[NSArray arrayWithObject:self.ba1];
    self.tool.items=itArray;
    [self.tool setBarStyle:UIBarStyleBlackOpaque];
    textview.inputAccessoryView=self.tool;
    
    
    jibenlable=[CreatModel createLableWithFrame:CGRectMake(10, -5,100, 50) andContent:@"基本信息:" andfont:[UIFont systemFontOfSize:20] andContentColor:[UIColor blackColor] andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentLeft];
    [view2 addSubview:jibenlable];
  /*
    //Toolbar******************************************
//    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@"calligrapher"] forToolbarPosition:0 barMetrics:UIBarMetricsDefault];
//   
//     
//    UIBarButtonItem *shufa=[[UIBarButtonItem alloc]initWithTitle:@"书法家" style:UIBarButtonItemStylePlain target:self action:@selector(shufa)];
//    shufa.image=[UIImage imageNamed:@"pen"];
//    
//    UIBarButtonItem *fuzhi=[[UIBarButtonItem alloc]initWithTitle:@"复制" style:UIBarButtonItemStylePlain target:self action:@selector(shufa)];
//    fuzhi.image=[UIImage imageNamed:@"document"];
//    
//    UIBarButtonItem *shouchang=[[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(shufa)];
//    
//    shouchang.image=[UIImage imageNamed:@"star"];
//    
//    UIBarButtonItem *fenxiang=[[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(shufa)];
//    
//    fenxiang.image=[UIImage imageNamed:@"share"];
//    //系统自动间隔
//    UIBarButtonItem *jiange3=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
//     //在toolbar中贴上一张图片
////    UIView *toolview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
////    toolview.backgroundColor=[UIColor yellowColor];
////    [self.navigationController.toolbar addSubview:toolview];
//    
//    NSArray *array=@[shufa,jiange3,fuzhi,jiange3,shouchang,jiange3,fenxiang];
//    //    [toolbar setItems:array animated:YES];//默认是隐藏的
//    [self.navigationController setToolbarHidden:NO animated:YES];
//    [self setToolbarItems:array animated:YES];
//    [fuzhi release];
//    [shufa release];
//    [shouchang release];
//    [fenxiang release];
//    [jiange3 release];
    */
    //------------------------------------------------------------------------
    //下方的横条
    UIView *blowview=[[UIView alloc]initWithFrame:CGRectMake(0,480-20-44-44+44, 380, 44)];
    blowview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher"]];
    [self.view addSubview:blowview];
    //设置横条上的view
    shufaView=[CreatModel createBlowViewWithFrame:CGRectMake(10, 0, 59, 44) andImage:[UIImage imageNamed:@"pen"] andImageFrame:CGRectMake(35/2, 2, 25, 28) andTitle:@"书法家" andTitleFrame:CGRectMake(35/2-5, 30, 40, 15)];
    [blowview addSubview:shufaView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shufago)];
    [shufaView addGestureRecognizer:tap];
    
    self.fuzhiView=[CreatModel createBlowViewWithFrame:CGRectMake(90, 0, 59, 44) andImage:[UIImage imageNamed:@"document"] andImageFrame:CGRectMake(35/2, 2, 29, 21) andTitle:@"复制" andTitleFrame:CGRectMake(35/2, 30, 40, 15)];
    [blowview addSubview:fuzhiView];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fuzhigo)];
    [fuzhiView addGestureRecognizer:tap2];
    
    self.shouchangView=[CreatModel createBlowViewWithFrame:CGRectMake(170, 0, 59, 44) andImage:[UIImage imageNamed:@"star"] andImageFrame:CGRectMake(35/2, 2, 28, 27) andTitle:@"收藏" andTitleFrame:CGRectMake(35/2, 30, 40, 15)];
    [blowview addSubview:shouchangView];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shouchanggo)];
    [shouchangView addGestureRecognizer:tap3];
    
    self.fenxiangView=[CreatModel createBlowViewWithFrame:CGRectMake(320-59-10, 0, 59, 44) andImage:[UIImage imageNamed:@"share"] andImageFrame:CGRectMake(35/2, 2, 24, 24) andTitle:@"分享"  andTitleFrame:CGRectMake(35/2-3, 30, 40, 15)];
    [blowview addSubview:fenxiangView];
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fenxianggo)];
    [fenxiangView addGestureRecognizer:tap4];
    [tap4 release];
    
     //------------------------------------------------------------------------
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)shufago
{
    shufaView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"enter"]];
    fuzhiView.backgroundColor=[UIColor clearColor];
    fenxiangView.backgroundColor=[UIColor clearColor];
    shouchangView.backgroundColor=[UIColor clearColor];
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"确定要进入书法家？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    
}
-(void)fuzhigo
{
    fuzhiView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"enter"]];
    shufaView.backgroundColor=[UIColor clearColor];
    fenxiangView.backgroundColor=[UIColor clearColor];
    shouchangView.backgroundColor=[UIColor clearColor];
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"确定要复制？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    [alertView release];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex//buttonIndex对应上面弹框的button按钮
{
    
    if (buttonIndex==1)
    {
        UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
        NSString *allString = [[NSString alloc]init];
        allString = textview.text;
        pasteBoard.string = allString;
        [allString release];
       
    }
    
    
}

-(void)shouchanggo
{
    self.shouchangView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"enter"]];
    fuzhiView.backgroundColor=[UIColor clearColor];
    shufaView.backgroundColor=[UIColor clearColor];
    fenxiangView.backgroundColor=[UIColor clearColor];
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"确定要收藏？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    
}
-(void)fenxianggo
{
    self.fenxiangView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"enter"]];
    fuzhiView.backgroundColor=[UIColor clearColor];
    shufaView.backgroundColor=[UIColor clearColor];
    shouchangView.backgroundColor=[UIColor clearColor];
    
//    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"确定要分享？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alertView show];
    
    
}

//-(void)rightgo
//{
//    NSLog(@"导航栏点击右边成功");
//}
//-(void)leftgo
//{
//    NSLog(@"导航栏点击左边成功");
//}

-(void)jiben:(UISegmentedControl *)sender
{
    int i=sender.selectedSegmentIndex;
    if (i==0)
    {
        jibenlable.text=@"基本信息:";
        textview.text=basestring;
        NSLog(@"基本信息");
    }
    if (i==1)
    {
        jibenlable.text=@"汉语字典:";
        textview.text=hanyustring;
        NSLog(@"汉语字典");
    }
    if (i==2)
    {
        jibenlable.text=@"组词成语:";
        textview.text=idiomstring;
        NSLog(@"组词成语");
    }
    if (i==3)
    {
        jibenlable.text=@"英文翻译:";
        textview.text=englishstring;
        NSLog(@"英文翻译");
    }


}
-(void)shufa
{
    NSLog(@"toolbar测试成功");

}

-(void)pybtngo
{
    NSLog(@"拼音读音GO");
    //创建URL对象
    NSString *string=@"http://api.ispeech.org/api/rest?apikey=8d1e2e5d3909929860aede288d6b974e&format=mp3&action=convert&voice=chchinesemale&text=";
    duyinString=@"%E5%A5%BD";
    NSString *urlString=[NSString stringWithFormat:@"%@%@",string,duyinString];
    NSURL *url=[NSURL URLWithString:urlString];
    //创建请求对象
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    //发起异步请求链接
    [NSURLConnection connectionWithRequest:req delegate:self];
}
//代理得实现以下三个方法：
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //链接建立开始
    NSLog(@"链接建立开始");
    //创建接收数据的二进制final对象
    self.final=[[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.final appendData:data];//把接收的数据传给二进制对象final
    //链接正在接受数据
    NSLog(@"链接正在接受数据量：%d",data.length);
    NSLog(@"链接已经接受数据量：%d",self.final.length);
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //链接完成下载
    NSLog(@"链接完成下载");
    AVAudioPlayer *avPlayer = [[AVAudioPlayer alloc] initWithData:self.final error:nil];
    [avPlayer play];//音频播放
    [avPlayer release];
    [self.fanti release];
}

-(void)returnDetailInfo:(Detailnfo*)sender
{
    
    hanyustring=sender.hanyustring;
    englishstring=sender.englishstring;
    basestring=sender.basestring;
    idiomstring=sender.idiomstring;
    textview.text=basestring;
    
}

-(void)hui:(id)sender
{
    [textview resignFirstResponder];//第一时间响应，使他缩回去
}
//整个视图晚上移动
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:1 animations:^{
        view2.frame=CGRectMake(5, 150+44-135, 316, 242);
    }];
    
}

-(void)dealloc
{
    self.topView=nil;
    self.pinyin=nil;
    self.busou=nil;
    self.fanti=nil;
    self.bishun=nil;
    self.zhuyin=nil;
    self.jiegou=nil;
    self.zongbihua=nil;
    self.bsbihua=nil;
    self.ziti=nil;

    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
