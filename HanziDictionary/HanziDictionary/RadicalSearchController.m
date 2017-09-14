

#import "RadicalSearchController.h"
#import "ConnectionDB.h"
#import "Radical.h"
#import "CreatModel.h"
#import "DisplaytViewController.h"
@interface RadicalSearchController ()

@end

@implementation RadicalSearchController
@synthesize bsArray,tbView,bsDic,allKeys,topView;
-(void)dealloc{
    self.tbView=nil;
    self.bsArray=nil;
    self.bsDic=nil;
    self.allKeys=nil;
    self.topView=nil;
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        
    }
    return self;
}

-(void)popBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
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
    
    
    //得到所有的部首对象存入数组bsArray中
    self.bsArray=[Radical findAll];
    
    //初始化存储部首数组的字典
    bsDic=[[NSMutableDictionary alloc]init];
    
    //创建数组allKeys，用作字典的关键字
    self.allKeys=@[@"笔画一",@"笔画二",@"笔画三",@"笔画四",@"笔画五",
                   @"笔画六",@"笔画七",@"笔画八",@"笔画九",@"笔画十",
                   @"笔画十一",@"笔画十二",@"笔画十三",@"笔画十四",@"笔画十五",
                   @"笔画十六",@"笔画十七"];
    
    //将所有部首按笔画分类 并按笔画数存入字典中
    for (int i=1; i<=17; i++) {
        
        NSMutableArray *bsArrayWithbihua=[[NSMutableArray alloc]init];
        
        for (int j=0; j<bsArray.count; j++) {
            
            Radical *rad=bsArray[j];
            
            //如果部首对象的笔画数等于i 则将其加入数组bsArrayWithbihua
            if (rad.bihua==i) {
                [bsArrayWithbihua addObject:rad];
            }
            
        }
        //将数组bsArrayWithbihua 按对应笔画加入字典 
        [self.bsDic setValue:bsArrayWithbihua forKey:[NSString stringWithFormat:@"%@",self.allKeys[i-1]]];
    }
    
    //创建单元格
    tbView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 480-44-20)];
    [self.view addSubview:self.tbView];
    //让单元格实现两个代理协议
    self.tbView.dataSource=self;
    self.tbView.delegate=self;
    [self.view addSubview:tbView];
    
    
    
}

//#pragma mark - 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allKeys.count;
}

#pragma mark - 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //根据所在分区数 获得该区对应关键字 通过关键字获得数组 并返回该数组个数
    NSString *key=[self.allKeys objectAtIndex:section];
    return [[self.bsDic objectForKey:key] count];
}

#pragma mark - 区头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.allKeys objectAtIndex:section];
}

#pragma mark - 定义单元格Header的高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

#pragma mark - 单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }

    //设置单元格的背景图片
    UIImageView *cellBackView=[[UIImageView alloc]init];
    cellBackView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    cell.backgroundView=cellBackView;
    [cellBackView release];
    
//    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"beijing"]];
    
    
    //改变选中的样式 为灰色 默认为蓝色
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    
    //通过分区获得部首个数关键字 再通过关键字获得该部首个数对应的数组  通过数组和所在分区中的行数获得部首对象
    NSArray *arr=[self.bsDic objectForKey:self.allKeys[indexPath.section]];
    Radical *bs=arr[indexPath.row];
    
    //设置部首的文字
    cell.textLabel.text=bs.title;
    
    //清除title的背景颜色
    cell.textLabel.backgroundColor=[UIColor clearColor];
    
    //令titleLabel中的字体居中
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
    //设置字体大小
    [cell.textLabel setFont:[UIFont systemFontOfSize:20]];
    
    //设置字体颜色
    [cell.textLabel setTextColor:REDCOLOR];
    
    return cell;
}

#pragma mark - 为表视图提供索引所需要的数据集合
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSArray *arr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",
                                            @"6",@"7",@"8",@"9",@"10",
                                            @"11",@"12",@"13",@"14",@"15",
                                            @"16",@"17", nil];
    return arr;
}


#pragma mark - 单元格 单击 事件处理函数
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    DisplaytViewController*display=[[DisplaytViewController alloc]init];
    
    [self.navigationController pushViewController:display animated:YES];

    
    //让被选中的行 慢慢消失选中标志  （默认选中变蓝色），也可以不要
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [display release];
}


//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    self.bsArray=[Radical findAll];//数据查询
//    [self.tableView reloadData];//重新加载
//    
//}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
