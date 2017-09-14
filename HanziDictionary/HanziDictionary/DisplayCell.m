//
//  SearchReaultCell.m
//  HanziDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "DisplayCell.h"
#import "CreatModel.h"
@implementation DisplayCell
@synthesize mizige,pinyin,bushou,bihuaNum,sound;
-(void)dealloc{
    self.mizige=nil;
    self.pinyin=nil;
    self.bushou=nil;
    self.bihuaNum=nil;
    self.sound=nil;
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置选中后的背景图片
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Key-frame1"]];
        self.selectedBackgroundView=imageView;
        [imageView release];
        //----------------米字格 显示汉字---------------
        UIImageView *mizigeView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 5, 39, 39)];
        mizigeView.image=[UIImage imageNamed:@"mizige"];
        [self.contentView addSubview:mizigeView];
        [mizigeView release];
        
        self.mizige=[CreatModel createLableWithFrame:CGRectMake(20, 5, 39, 39)
                                          andContent:nil
                                             andfont:nil
                                     andContentColor:nil
                                  andBackgroundColor:[UIColor clearColor]
                                    andTextAlignment:NSTextAlignmentCenter];
        
        [self.contentView addSubview:self.mizige];
        
         //----------------label 显示拼音---------------
        
        self.pinyin=[CreatModel createLableWithFrame:CGRectMake(mizige.frame.origin.x+mizige.frame.size.width+15, 4, 120, 20)
                                          andContent:nil
                                             andfont:nil
                                     andContentColor:REDCOLOR
                                  andBackgroundColor:[UIColor clearColor]
                                    andTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:pinyin];
        //----------------UiimageView 显示发音图片---------------
        self.sound=[CreatModel createButtonWithType:0
                                           andFrame:CGRectMake(pinyin.frame.origin.x+pinyin.frame.size.width, 5, 25, 23)
                                   andNormalBgImage:[UIImage imageNamed:@"loud"]
                                andHighLightedImage:nil
                                           andTitle:nil
                                      andTitileFont:nil
                                      andTitleColor:nil
                                          andTarget:nil
                                          andAction:nil
                                   andControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self.sound];
        //----------------label 显示部首---------------
        self.bushou=[CreatModel createLableWithFrame:CGRectMake(mizige.frame.origin.x+mizige.frame.size.width+15, pinyin.frame.origin.y+pinyin.frame.size.height+5, 120, 20)
                                         andContent:nil
                                            andfont:nil
                                    andContentColor:REDCOLOR
                                 andBackgroundColor:[UIColor clearColor]
                                   andTextAlignment:NSTextAlignmentLeft];
        
        [self.contentView addSubview:bushou];
        
        
        //----------------label 显示笔画---------------
        
        self.bihuaNum=[CreatModel createLableWithFrame:CGRectMake(bushou.frame.origin.x+bushou.frame.size.width, pinyin.frame.origin.y+pinyin.frame.size.height+5, 120, 20)
                                            andContent:nil
                                               andfont:nil
                                       andContentColor:REDCOLOR
                                    andBackgroundColor:[UIColor clearColor]
                                      andTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:bihuaNum];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
