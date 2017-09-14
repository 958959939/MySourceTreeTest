//
//  ProgressBarViewController.m
//  HanziDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 孙启智. All rights reserved.
//

#import "ProgressBarViewController.h"

@interface ProgressBarViewController ()

@end

@implementation ProgressBarViewController

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
	// Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"startup-interface"]];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
