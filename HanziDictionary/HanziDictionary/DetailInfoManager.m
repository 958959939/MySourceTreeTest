//
//  DetailInfoManager.m
//  HanziDictionary
//
//  Created by 努力+坚持+加油 on 13-6-25.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "DetailInfoManager.h"
#import "Detailnfo.h"
#import "DetailViewController.h"
#import "JSON.h"

@implementation DetailInfoManager

-(id)init{
    if (self=[super init])
    {
        DetailInfoArray =[[NSMutableArray alloc]init];
    }
    return self;
}

@synthesize DetailInfoArray,final;

-(void)downDetailInfoWithHanZi:(NSString *) hanzi
{
    
    NSString *urlString= [NSString stringWithFormat:@"http://www.chazidian.com/service/word/%@",hanzi];
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"正在建立");
    self.final=[[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.final appendData:data];
    NSLog(@"%d,%d",data.length,self.final.length);
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *json=[[NSString alloc]initWithData:self.final encoding:NSUTF8StringEncoding];
    NSDictionary *a=[json JSONValue];
    NSDictionary *b=[a objectForKey:@"data"];
    
    Detailnfo *detailnfo=[[Detailnfo alloc]init];
    detailnfo.hanyustring=[b objectForKey:@"hanyu"];
    detailnfo.basestring=[b objectForKey:@"base"];
    detailnfo.englishstring=[b objectForKey:@"english"];
    detailnfo.idiomstring=[b objectForKey:@"idiom"];
    
     
    
   [self.delegate returnDetailInfo:detailnfo];
    NSLog(@"%@,%@,%@,%@",detailnfo.hanyustring,detailnfo.hanyustring,detailnfo.basestring,detailnfo.idiomstring);
}


@end
