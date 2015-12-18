//
//  ViewController.m
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//

#import "ViewController.h"
#import "YYFlatStyleTimePickerView.h"
#import "YYFlatSwitch.h"

@interface ViewController ()

@end

@implementation ViewController{
    UILabel *label;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //Do any additional setup after loading the view, typically from a nib.
    YYFlatStyleTimePickerView *timePicker = [[YYFlatStyleTimePickerView alloc]initWithWidth:300];
    [self.view addSubview:timePicker];
    
//    label = [[UILabel alloc]initWithFrame:CGRectMake(110, 200, 100, 50)];
//    label.text = @"switch off";
//    [self.view addSubview:label];
//    
//    YYFlatSwitch *myswitch = [[YYFlatSwitch alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    myswitch.center = timePicker.center;
//    [self.view addSubview:myswitch];
//    
//    [myswitch addTarget:self action:@selector(doSwitch:) forControlEvents:UIControlEventTouchDown];
}

//-(void)doSwitch:(YYFlatSwitch *)sender{
//    if (!sender.on) {
//        label.text = @"switch on";
//    }
//    else{
//        label.text = @"switch off";
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
