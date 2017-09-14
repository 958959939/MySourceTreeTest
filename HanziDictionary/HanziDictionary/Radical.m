

#import "Radical.h"
#import <sqlite3.h>
#import "ConnectionDB.h"

@implementation Radical

+(NSMutableArray *)findAll{//全表查询
    
    NSMutableArray *radArray=nil;//返回的查询结果
    
    sqlite3 *sql3=[ConnectionDB createDB];//获取数据连接
    
    //声明sql语句对象
    sqlite3_stmt *st;
    
    int p= sqlite3_prepare_v2(sql3, "select *from ol_bushou", -1, &st , nil);
    
    
    if (p==SQLITE_OK) {//判断sql语法正确性
        radArray=[[NSMutableArray alloc]init];
        
        while (sqlite3_step(st)==SQLITE_ROW) {//是否查询到记录
            Radical *rad=[[Radical alloc]init];
            rad.bsid=sqlite3_column_int(st, 0);
            rad.bihua=sqlite3_column_int(st, 1);
            rad.title=[NSString stringWithCString:(char *)sqlite3_column_text(st, 2) encoding:NSUTF8StringEncoding];
            
            [radArray addObject:rad];//将每条记录存入部首对象rad、并将对象存入数组radArray
            [rad release];
        }
    }
    sqlite3_finalize(st);//关语句 不是关连接
    
    return [radArray autorelease];
    
}

@end
