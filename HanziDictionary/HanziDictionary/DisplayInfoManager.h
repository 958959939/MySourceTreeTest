//
//  DisplayInfoManager.h
//  HanziDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DisplayInfoManagerProtocol <NSObject>

-(void)returnCellInfoArray:(id)sender;

@end



@interface DisplayInfoManager : NSObject

@property(retain,nonatomic)NSMutableData *mutableData;
@property(retain,nonatomic)NSMutableArray *cellInfoArray;
@property(assign,nonatomic)id<DisplayInfoManagerProtocol>delegate;

-(void)downCellInfoWithBushouId:(int)bushouId andPageId:(int)pageId;

@end


