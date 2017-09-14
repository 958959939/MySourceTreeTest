//
//  CreatLabel.m
//  HanziDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "CreatModel.h"

@implementation CreatModel

+(UILabel *) createLableWithFrame:(CGRect)frame
                       andContent:(NSString *)content
                          andfont:(UIFont *)font
                  andContentColor:(UIColor *)contentColor
               andBackgroundColor:(UIColor *)backgroundColor
                 andTextAlignment:(NSTextAlignment)textAlignment
{
    //创建UILable对象并设置位置大小
    UILabel * lable = [[UILabel alloc]initWithFrame:frame];
    //设置标题
    lable.text = content;
    //设置字体颜色
    lable.textColor = contentColor;
    //设置背景颜色
    lable.backgroundColor = backgroundColor;
    //设置字体大小
    lable.font = font;
    //设置字体格式
    lable.textAlignment = textAlignment;
    
    return [lable autorelease];
}

+(UILabel *) createLableWithFrame:(CGRect)frame
                         andTitle:(NSString *)title
                      andsubtitle:(NSString *)subtitle
                          andfont:(UIFont *)font
                  andContentColor:(UIColor *)contentColor
               andBackgroundColor:(UIColor *)backgroundColor
                 andTextAlignment:(NSTextAlignment)textAlignment
{
    //创建UILable对象并设置位置大小
    UILabel * lable = [[UILabel alloc]initWithFrame:frame];
    //设置内容
    lable.text =[[NSString alloc]initWithFormat:@"%@：%@",title,subtitle];
    //设置字体颜色
    lable.textColor = contentColor;
    //设置背景颜色
    lable.backgroundColor = backgroundColor;
    //设置字体大小
    lable.font = font;
    //设置字体格式
    lable.textAlignment = textAlignment;
    
    return [lable autorelease];
}


+(id)createButtonWithType:(UIButtonType)buttonType
                 andFrame:(CGRect)btnFrame
         andNormalBgImage:(UIImage*)bgImgNormal
      andHighLightedImage:(UIImage*)bgImgHighlighted
                 andTitle:(NSString*)title
            andTitileFont:(UIFont*)titleFont
            andTitleColor:(UIColor *)titleColor
                andTarget:(id)target
                andAction:(SEL)selecter
         andControlEvents:(UIControlEvents)contrlEvents
{
    
    UIButton *btn=[UIButton buttonWithType:buttonType];
    btn.frame=btnFrame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font =titleFont;
    [btn setBackgroundImage:bgImgNormal forState:UIControlStateNormal];
    [btn setBackgroundImage:bgImgHighlighted forState:UIControlStateHighlighted];
    [btn setBackgroundImage:bgImgHighlighted forState:UIControlStateSelected];
    [btn addTarget:target action:selecter forControlEvents:contrlEvents];
    
    return btn;//前面btn是类方法创建的已经是autorelease 所以此处返回不需要再使用autorelease
}

+(id)createBlowViewWithFrame:(CGRect)viewframe
                    andImage:(UIImage*)Img
               andImageFrame:(CGRect)imgframe
                    andTitle:(NSString*)title
               andTitleFrame:(CGRect)titleframe
{
    UIView *view=[[UIView alloc]initWithFrame:viewframe];
    //    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(35/2, 2, 25, 28)];
    UIImageView *image=[[UIImageView alloc]initWithFrame:imgframe];
    image.image=Img;
    //    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(35/2-5, 30, 40, 15)];
    UILabel *lable=[[UILabel alloc]initWithFrame:titleframe];
    lable.backgroundColor=[UIColor clearColor];
    lable.text=title;
    lable.font=[UIFont systemFontOfSize:13];
    lable.textColor=[UIColor whiteColor];
    [view addSubview:image];
    [view addSubview:lable];
    
    
    
    return view;
}



//+(id)createTopViewWith:(NSString *)topTitle
//          andLeftImage:(UIImage *)leftImage
//              andLRect:(CGRect)lImgRect
//            andLTarget:(id)lTarget
//            andLAction:(SEL)lAction
//             andRImage:(UIImage *)rightImage
//              andRRect:(CGRect)rImgRect
//            andRTarget:(id)rTarget
//            andRAction:(SEL)rAction
// {
//    //自己创建类似导航条的view
//    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//    topView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher"]];
//    
//    //title 汉语字典
//    UILabel *title=[CreatModel createLableWithFrame:CGRectMake(0, 0, 320, 44)
//                                         andContent:topTitle
//                                            andfont:TITLEFONT
//                                    andContentColor:[UIColor whiteColor]
//                                 andBackgroundColor:[UIColor clearColor]
//                                   andTextAlignment:NSTextAlignmentCenter];
//    [topView addSubview:title];
//    
//    //添加左边图片和响应事件
//     if (leftImage) {
//         
//     }
//     
//     
//     //添加右边图片和响应事件
//    if (rightImage) {
//        //竖直分割条
//        UIImageView *topRImgView=[[UIImageView alloc]initWithFrame:CGRectMake(320-61, 0, 1, 44)];
//        topRImgView.image=rightImage;
//        [topView addSubview:topRImgView];
//        [topRImgView release];
//        
//        //右边用于
//        UIView *rightView=[[UIView alloc]initWithFrame:CGRectMake(320-60, 0, 60, 44)];
//        rightView.tag=100;
//        [topView addSubview:rightView];
//        //添加手势
//        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:rTarget action:rAction];
//        [topView addGestureRecognizer:tap];
//        [tap release];
//        //承载图片
//        UIImageView *img=[[UIImageView alloc]initWithFrame:rImgRect];
//        img.image=rightImage;
//        [topRImgView addSubview:img];
//   
//    }

     
     
     
     
//     //自己创建类似导航条的view
//     topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//     topView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher"]];
//     [self.view addSubview:topView];
//     
//     //title 汉语字典
//     UILabel *title=[CreatModel createLableWithFrame:CGRectMake(0, 0, 320, 44)
//                                          andContent:@"汉语字典"
//                                             andfont:TITLEFONT
//                                     andContentColor:[UIColor whiteColor]
//                                  andBackgroundColor:[UIColor clearColor]
//                                    andTextAlignment:NSTextAlignmentCenter];
//     [topView addSubview:title];
//     
//     //竖直分割条
//     UIImageView *topimg=[[UIImageView alloc]initWithFrame:CGRectMake(320-61, 0, 1, 44)];
//     topimg.image=[UIImage imageNamed:@"top"];
//     [topView addSubview:topimg];
//     [topimg release];
//     
//     //more按钮
//     UIButton *more=[UIButton buttonWithType:UIButtonTypeCustom];
//     more.frame=CGRectMake(320-60+(60-23)/2, (44-5)/2, 23, 5);
//     [more setBackgroundImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
//     [topView addSubview:more];
    
//}
@end
