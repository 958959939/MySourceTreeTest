//
//  Pinyin.m
//  HanziDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "Pinyin.h"
#import <sqlite3.h>
#import "ConnectionDB.h"

@implementation Pinyin

+(NSMutableArray *)findAll{//全表查询
    
    NSMutableArray *pinyinArray=nil;//返回的查询结果
    
    sqlite3 *sql3=[ConnectionDB createDB];//获取数据连接
    
    //声明sql语句对象
    sqlite3_stmt *st;
    
    int p= sqlite3_prepare_v2(sql3, "select *from ol_pinyins where id>26 order by pinyin", -1, &st , nil);
    
    
    if (p==SQLITE_OK) {//判断sql语法正确性
        pinyinArray=[[NSMutableArray alloc]init];
        
        while (sqlite3_step(st)==SQLITE_ROW) {//是否查询到记录
            Pinyin *py=[[Pinyin alloc]init];
            py.pinyinid=sqlite3_column_int(st, 0);
            py.pinyin=[NSString stringWithCString:(char *)sqlite3_column_text(st, 1) encoding:NSUTF8StringEncoding];

            [pinyinArray addObject:py];//将每条记录存入部首对象rad、并将对象存入数组radArray
            [py release];
        }
    }
    
    sqlite3_finalize(st);//关语句 不是关连接
    
    return [pinyinArray autorelease];
    
}


@end
