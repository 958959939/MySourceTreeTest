//
//  fenxiangViewController.m
//  HanziDictionary
//
//  Created by 努力+坚持+加油 on 13-6-25.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "fenxiangViewController.h"

@interface fenxiangViewController ()

@end

@implementation fenxiangViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_web release];
    [super dealloc];
}
@end
