//
//  DetailInfoManager.h
//  HanziDictionary
//
//  Created by 努力+坚持+加油 on 13-6-25.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DetailInfoManagerProtocol <NSObject>

-(void)returnDetailInfo:(id)sender;

@end


@interface DetailInfoManager : NSObject<NSURLConnectionDataDelegate>

@property(assign,nonatomic)id<DetailInfoManagerProtocol>delegate;
@property(retain,nonatomic)NSMutableData *final;
@property(retain,nonatomic)NSMutableArray *DetailInfoArray;

-(void)downDetailInfoWithHanZi:(NSString *) hanzi;


@end
