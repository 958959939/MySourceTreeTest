//
//  CreatLabel.h
//  HanziDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreatModel : NSObject
//创建Label的方法
+(UILabel *) createLableWithFrame:(CGRect)frame
                       andContent:(NSString *)content
                          andfont:(UIFont *)font
                  andContentColor:(UIColor *)contentColor
               andBackgroundColor:(UIColor *)backgroundColor
                 andTextAlignment:(NSTextAlignment)textAlignment;

+(UILabel *) createLableWithFrame:(CGRect)frame
                         andTitle:(NSString *)title
                      andsubtitle:(NSString *)subtitle
                          andfont:(UIFont *)font
                  andContentColor:(UIColor *)contentColor
               andBackgroundColor:(UIColor *)backgroundColor
                 andTextAlignment:(NSTextAlignment)textAlignment;

//创建button的方法
+(id)createButtonWithType:(UIButtonType)buttonType
                 andFrame:(CGRect)btnFrame
         andNormalBgImage:(UIImage*)bgImgNormal
      andHighLightedImage:(UIImage*)bgImgHighlighted
                 andTitle:(NSString*)title
            andTitileFont:(UIFont*)titleFont
            andTitleColor:(UIColor *)titleColor
                andTarget:(id)target
                andAction:(SEL)selecter
         andControlEvents:(UIControlEvents)contrlEvents;

+(id)createBlowViewWithFrame:(CGRect)viewframe
                    andImage:(UIImage*)Img
               andImageFrame:(CGRect)imgframe
                    andTitle:(NSString*)title
               andTitleFrame:(CGRect)titleframe;

@end
