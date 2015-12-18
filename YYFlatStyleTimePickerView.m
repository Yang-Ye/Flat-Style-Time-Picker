//
//  YYFlatStyleTimePickerView.m
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//
#define DEFAULTPICKERVIEWWIDTH 180

#import "YYFlatStyleTimePickerView.h"

@implementation YYFlatStyleTimePickerView{
    CGFloat pickerViewWidth;
    CGFloat pickerViewHeight;
    
    UILabel *hourLabel;
    UILabel *minuteLabel;
    UILabel *AMPMLabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        pickerViewWidth = frame.size.width;
        pickerViewHeight = pickerViewWidth*1.775;
        [self initilizationWithWidth:pickerViewWidth atPosition:frame.origin];
    }
    return  self;
}

-(instancetype)initWithWidth:(CGFloat)width{
    self = [super init];
    if (self) {
        pickerViewWidth = width;
        pickerViewHeight = width*1.775;

        [self initilizationWithWidth:width atPosition:CGPointZero];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)initilizationWithWidth:(CGFloat)width atPosition:(CGPoint)position{
    
    self.backgroundColor = [UIColor grayColor];
    self.frame = CGRectMake(position.x, position.y, width, width*1.775);
    
    UILabel *columnLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, pickerViewWidth*0.1, pickerViewHeight*0.20)];
    columnLabel.center = CGPointMake(self.center.x, columnLabel.center.y);
    [self labelSharedSetting:columnLabel];
    columnLabel.text = @":";
    columnLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:columnLabel];
    
    hourLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, pickerViewWidth/2 - columnLabel.frame.size.width/2, pickerViewHeight*0.20)];
    hourLabel.textAlignment = NSTextAlignmentRight;
    hourLabel.text = @"12";
    UIColor* flatRed = [UIColor colorWithRed: 0.931 green: 0.43 blue: 0.43 alpha: 1];
    [self labelSharedSetting:hourLabel];
    hourLabel.textColor = flatRed;
    [self addSubview:hourLabel];
    
    minuteLabel = [[UILabel alloc]initWithFrame:CGRectMake(pickerViewWidth/2+columnLabel.frame.size.width/2, 0, pickerViewWidth/2-columnLabel.frame.size.width/2, pickerViewHeight*0.20)];
    minuteLabel.textAlignment = NSTextAlignmentLeft;
    minuteLabel.text = @"05";
    [self labelSharedSetting:minuteLabel];
    [self addSubview:minuteLabel];
    
    [self roundTimePickerSetup];
}

-(void)labelSharedSetting:(UILabel *)label{
    UIColor* flatDarkGray = [UIColor colorWithRed: 0.348 green: 0.341 blue: 0.341 alpha: 1];
    label.backgroundColor = flatDarkGray;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:70];
}

-(void)roundTimePickerSetup{
    YYRoundTimePicker *roundTimePicker = [[YYRoundTimePicker alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.9, self.frame.size.width*0.9)];
    roundTimePicker.center = self.center;
    [self addSubview:roundTimePicker];
}
@end
