//
//  SearchResultViewController.m
//  HanziDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "DisplaytViewController.h"
#import "CreatModel.h"
#import "DisplayInfoManager.h"
#import "DisplayCell.h"
#import "CellInfo.h"
#import "DetailViewController.h"

@interface DisplaytViewController ()

@end

@implementation DisplaytViewController
@synthesize topView,topTitel,tbView,showArray;
-(void)dealloc{
    self.topView=nil;
    self.topTitel=nil;
    self.tbView=nil;
    self.showArray=nil;
    
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        showArray=[[NSMutableArray alloc]init];
        
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
    //获得显示数据
    DisplayInfoManager *dis=[[DisplayInfoManager alloc]init];
    dis.delegate=self;
    
    [dis downCellInfoWithBushouId:1 andPageId:1];
    
    
    
    
    //------------------------------------------------------------
    
    //创建单元格
    tbView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 480-44-20)];
    [self.view addSubview:self.tbView];
    //让单元格实现两个代理协议
    self.tbView.dataSource=self;
    self.tbView.delegate=self;
    [self.view addSubview:tbView];
    
    
}

-(void)returnCellInfoArray:(id)sender{
    [self.showArray addObjectsFromArray:sender];
    [self.tbView reloadData];
}


#pragma mark - 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.showArray.count;
}

#pragma mark - 单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    DisplayCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    if (cell==nil)
    {
        cell=[[DisplayCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    //设置单元格的背景图片
    UIImageView *cellBackView=[[UIImageView alloc]init];
    cellBackView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    cell.backgroundView=cellBackView;
    [cellBackView release];
    
    //改变选中的样式 为灰色 
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    //获得CellInfo对象
    CellInfo *cellInfo=self.showArray[indexPath.row];
    
    //----------设置单元格内容-------
    //米字格内容
    cell.mizige.text=cellInfo.mizige;
    
    //拼音内容 
    NSArray *pinyinArr=[cellInfo.pinyin componentsSeparatedByString:@","];
    //为拼音内容加上[]
    NSMutableString *pinyin=[[NSMutableString alloc]init];
    for (int i=0;i<pinyinArr.count;i++) {
        NSString *py=[NSString stringWithFormat:@"[%@]",pinyinArr[i]];
        [pinyin appendString:py];
    }
    cell.pinyin.text=pinyin;
     [pinyin release];
    //部首内容
    cell.bushou.text=[NSString stringWithFormat:@"部首：%@",cellInfo.bushou];
    
    //笔画数内容
    cell.bihuaNum.text=[NSString stringWithFormat:@"笔画：%@",cellInfo.bihuaNum];
   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44+5+5;
}

#pragma mark - 单元格 单击 事件处理函数
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    //让被选中的行 慢慢消失选中标志  （默认选中变蓝色），也可以不要
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CellInfo *cellinfo=self.showArray[indexPath.row];
    DetailViewController *detail=[[DetailViewController alloc]init];
    
    
    detail.hanzi=cellinfo.mizige;
    [self.navigationController pushViewController:detail animated:YES];
    
    //拼音
    detail.pinyin.text=[NSString stringWithFormat:@"拼音:%@",cellinfo.pinyin];
    NSLog(@"%@",detail.pinyin.text);
    //繁体
    detail.fanti.text=[NSString stringWithFormat:@"繁体:%@",cellinfo.fanti];
    //部首
    detail.busou.text=[NSString stringWithFormat:@"部首:%@",cellinfo.bushou];
    //笔顺
    detail.bishun.text=[NSString stringWithFormat:@"笔顺:%@",cellinfo.bishun];
    //结构
    detail.jiegou.text=[NSString stringWithFormat:@"结构:%@",cellinfo.jiegou];
    //部首笔画
    detail.bsbihua.text=[NSString stringWithFormat:@"部首笔画:%@",cellinfo.bsNum];
    //笔画
    detail.zongbihua.text=[NSString stringWithFormat:@"笔画:%@",cellinfo.bihuaNum];
    //字体
    detail.ziti.text=cellinfo.mizige;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
