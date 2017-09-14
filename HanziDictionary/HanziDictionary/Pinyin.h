//
//  Pinyin.h
//  HanziDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pinyin : NSObject

@property(assign,nonatomic)int pinyinid;
@property(retain,nonatomic)NSString *pinyin;

+(NSMutableArray *)findAll;

@end
