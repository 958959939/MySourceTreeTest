//
//  DisplayInfoManager.m
//  HanziDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "DisplayInfoManager.h"
#import "JSON.h"

#import "CellInfo.h"

@implementation DisplayInfoManager
@synthesize cellInfoArray,mutableData;
-(void)dealloc{
    self.cellInfoArray=nil;
    self.mutableData=nil;
    
    [super dealloc];
}

-(id)init{
    if (self=[super init]) {
        cellInfoArray =[[NSMutableArray alloc]init];
    }
    return self;
}

-(void)downCellInfoWithBushouId:(int)bushouId andPageId:(int)pageId
{
    NSString *urlStr=[NSString stringWithFormat:@"http://www.chazidian.com/service/bushou/%d/%d/10",bushouId,pageId];
    
    NSURL *url=[NSURL URLWithString:urlStr];
    
    NSURLRequest *req=[NSURLRequest requestWithURL:url];

    [NSURLConnection connectionWithRequest:req delegate:self];
    
}

//异步接受json的三个协议
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    mutableData=[[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.mutableData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{

    //将data转换为字符串型的json
    NSString *json=[[NSString alloc]initWithData:self.mutableData encoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDic=[json JSONValue];
    
    NSArray *wordsArr=jsonDic[@"data"][@"words"];
    
    for (int i=0; i<wordsArr.count; i++) {
        CellInfo *cellinfo=[[CellInfo alloc]init];
        
        NSDictionary *word=wordsArr[i];
        //汉字
        cellinfo.mizige=word[@"simp"];
        //拼音
        cellinfo.pinyin=word[@"yin"][@"pinyin"];
        //繁体
        cellinfo.fanti=word[@"tra"];
        //部首
        cellinfo.bushou=word[@"bushou"];
        //笔顺
        cellinfo.bishun=word[@"seq"];
        
        //结构
        cellinfo.jiegou=word[@"frame"];
        //部首笔画
        cellinfo.bsNum=word[@"bsnum"];
        //笔画数目
        cellinfo.bihuaNum=word[@"num"];
        
        
        
        NSLog(@"字为：%@，繁体为：%@，拼音为：%@，部首为：%@，部首笔画为：%@，总笔画为：%@，结构为：%@，笔顺为：%@",cellinfo.mizige,cellinfo.fanti,cellinfo.pinyin,cellinfo.bushou,cellinfo.bsNum,cellinfo.bihuaNum,cellinfo.jiegou,cellinfo.bishun); 
        
        
       
        
        [self.cellInfoArray addObject:cellinfo];
        [cellinfo release];
    }
    
    [json release];
    NSLog(@"%@",cellInfoArray);
    [self.delegate returnCellInfoArray:self.cellInfoArray];
    
}


@end
