//
//  ViewController.m
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//

#import "ViewController.h"
#import "YYFlatStyleTimePickerView.h"

@interface ViewController ()

@end

@implementation ViewController{
    YYFlatStyleTimePickerView *timePicker;
    UILabel *label;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    timePicker = [[YYFlatStyleTimePickerView alloc]initWithWidth:300];
    timePicker.center = self.view.center;
    [timePicker.confirmButton addTarget:self action:@selector(confirmButtonAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:timePicker];
    
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 60, 400, 100)];
    label.center = CGPointMake(self.view.center.x, label.frame.origin.y);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"time";
    label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:40];
    [self.view addSubview:label];
    
}

-(void)confirmButtonAction{
    label.text = timePicker.pickedTimeIntervalString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
