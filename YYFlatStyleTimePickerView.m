//
//  YYFlatStyleTimePickerView.m
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//
#define DEFAULTPICKERVIEWWIDTH 300
#import "YYFlatStyleTimePickerView.h"

@implementation YYFlatStyleTimePickerView{
    double sizeRatio;
    CGFloat pickerViewWidth;
    CGFloat pickerViewHeight;
    
    UIButton *hourLabelButton;
    UIButton *minuteLabelButton;
    
    UIColor* flatRed;
    UIColor* flatDarkGray;
    
    UIButton *AMSwitch;
    UIButton *PMSwitch;
    
    YYRoundTimePicker *roundTimePicker;
    
    NSTimeInterval pickedHour;
    NSTimeInterval pickedMinute;
    
    YYRoundTimePickerValueButton *lastTappedHour;
    YYRoundTimePickerValueButton *lastTappedMinute;
    
    NSDateComponentsFormatter *dateComponentsFormatter;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        pickerViewWidth = frame.size.width;
        sizeRatio = pickerViewWidth/DEFAULTPICKERVIEWWIDTH;
        pickerViewHeight = pickerViewWidth*1.775;
        
        flatRed = [UIColor colorWithRed: 0.931 green: 0.43 blue: 0.43 alpha: 1];
        flatDarkGray = [UIColor colorWithRed: 0.348 green: 0.341 blue: 0.341 alpha: 1];
        
        [self initilizationWithWidth:pickerViewWidth atPosition:frame.origin];
    }
    return  self;
}

-(instancetype)initWithWidth:(CGFloat)width{
    self = [self initWithFrame:CGRectMake(0, 0, width, width*1.775)];
    return  self;
}

-(void)initilizationWithWidth:(CGFloat)width atPosition:(CGPoint)position{
    self.backgroundColor = [UIColor grayColor];
    self.frame = CGRectMake(position.x, position.y, width, width*1.775);
    [self dateFormatterConvertNSTimeIntervalToReadable];
    
    UILabel *columnLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, pickerViewWidth*0.1, pickerViewHeight*0.20)];
    columnLabel.center = CGPointMake(self.center.x, columnLabel.center.y);
    columnLabel.textColor = [UIColor whiteColor];
    columnLabel.backgroundColor = flatDarkGray;
    [self labelSharedSetting:columnLabel];
    columnLabel.text = @":";
    columnLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:columnLabel];
    
    hourLabelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, pickerViewWidth/2 - columnLabel.frame.size.width/2, pickerViewHeight*0.20)];
    [hourLabelButton addTarget:self action:@selector(timehourLabelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    hourLabelButton.backgroundColor = flatDarkGray;
    hourLabelButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [hourLabelButton setTitle:@"12" forState:UIControlStateNormal];
    [self labelSharedSetting:hourLabelButton.titleLabel];
    hourLabelButton.selected = YES;
    hourLabelButton.titleLabel.textColor = flatRed;
    [hourLabelButton setTitleColor:flatRed forState:UIControlStateNormal];
    [self addSubview:hourLabelButton];
    
    minuteLabelButton = [[UIButton alloc]initWithFrame:CGRectMake(pickerViewWidth/2+columnLabel.frame.size.width/2, 0, pickerViewWidth/2-columnLabel.frame.size.width/2, pickerViewHeight*0.20)];
    [minuteLabelButton addTarget:self action:@selector(timeminuteLabelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    minuteLabelButton.backgroundColor = flatDarkGray;
    minuteLabelButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [minuteLabelButton setTitle:@"00" forState:UIControlStateNormal];
    [self labelSharedSetting:minuteLabelButton.titleLabel];
    [minuteLabelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:minuteLabelButton];
    
    pickedMinute = 0;
    pickedHour = 12;
    
    [self roundTimePickerSetup];
    [self buttonsSetup];
    [self switchButtonSetup];
}

-(void)dateFormatterConvertNSTimeIntervalToReadable{
    dateComponentsFormatter = [[NSDateComponentsFormatter alloc] init];
    dateComponentsFormatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    dateComponentsFormatter.allowedUnits = (NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
}

-(void)timehourLabelButtonAction:(UIButton *)sender{
    if (!sender.selected) {
        sender.selected = YES;
        [roundTimePicker setPickerType:YYRoundTimePickerHour];
        [sender setTitleColor:flatRed forState:UIControlStateNormal];
        minuteLabelButton.selected = NO;
        [minuteLabelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self valueButtonGetTappedAction:lastTappedHour];
    }
}

-(void)timeminuteLabelButtonAction:(UIButton *)sender{
    if (!sender.selected) {
        sender.selected = YES;
        [roundTimePicker setPickerType:YYRoundTimePickerMinute];
        [sender setTitleColor:flatRed forState:UIControlStateNormal];
        hourLabelButton.selected = NO;
        [hourLabelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self valueButtonGetTappedAction:lastTappedMinute];
    }
}


-(void)labelSharedSetting:(UILabel *)label{
    label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:70*sizeRatio];
}

-(void)roundTimePickerSetup{
    roundTimePicker = [[YYRoundTimePicker alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.9, self.frame.size.width*0.9)];
    roundTimePicker.center = self.center;
    for (YYRoundTimePickerValueButton *valueButton in roundTimePicker.valueButtonArray) {
        [valueButton addTarget:self action:@selector(valueButtonGetTappedAction:) forControlEvents:UIControlEventTouchUpInside];
        if (valueButton.tag == 12) {
            [self valueButtonGetTappedAction:valueButton];
            lastTappedHour = valueButton;
            lastTappedMinute = valueButton;
        }
    }
    [self addSubview:roundTimePicker];
}

-(void)valueButtonGetTappedAction:(YYRoundTimePickerValueButton *)sender{
    if (!sender.selected) {
        for (YYRoundTimePickerValueButton *valueButton in roundTimePicker.valueButtonArray) {
            if (valueButton.selected) {
                valueButton.selected = NO;
                valueButton.backgroundColor = [UIColor clearColor];
            }
        }
        sender.selected = YES;
        sender.backgroundColor = flatRed;
        if (roundTimePicker.type == YYRoundTimePickerHour) {
            pickedHour = sender.value;
            [hourLabelButton setTitle:[NSString stringWithFormat:@"%02d",(int)sender.value] forState:UIControlStateNormal];
            lastTappedHour = sender;
            pickedHour = sender.value;
        }
        else{
            pickedMinute = sender.value;
            [minuteLabelButton setTitle:[NSString stringWithFormat:@"%02d",(int)sender.value] forState:UIControlStateNormal];
            lastTappedMinute = sender;
            pickedMinute = sender.value;
        }
        if (_AMTurnedOn) {
            _pickedTimeInterval = 3600*pickedHour + 60*pickedMinute;
        }
        else{
            _pickedTimeInterval = 3600*(pickedHour+12) + 60*pickedMinute;

        }
        _pickedTimeIntervalString = [dateComponentsFormatter stringFromTimeInterval:_pickedTimeInterval];
    }
}

-(void)switchButtonSetup{
    AMSwitch = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, pickerViewWidth*0.2, pickerViewWidth*0.2)];
    AMSwitch.layer.anchorPoint = CGPointMake(0.5, 0.5);
    AMSwitch.layer.position = CGPointMake(pickerViewWidth/6, pickerViewHeight*0.80);
    AMSwitch.layer.cornerRadius = AMSwitch.frame.size.width/2;
    AMSwitch.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20*sizeRatio];
    [AMSwitch setTitle:@"AM" forState:UIControlStateNormal];
    [self timeSwitchChangeAM:AMSwitch];
    [AMSwitch addTarget:self action:@selector(timeSwitchChangeAM:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:AMSwitch];
    
    PMSwitch = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, pickerViewWidth*0.2, pickerViewWidth*0.2)];
    PMSwitch.layer.anchorPoint = CGPointMake(0.5, 0.5);
    PMSwitch.layer.position = CGPointMake(pickerViewWidth*5/6, pickerViewHeight*0.80);
    PMSwitch.backgroundColor = flatDarkGray;
    PMSwitch.layer.cornerRadius = PMSwitch.frame.size.width/2;
    PMSwitch.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20*sizeRatio];
    [PMSwitch setTitle:@"PM" forState:UIControlStateNormal];
    [PMSwitch addTarget:self action:@selector(timeSwitchChangePM:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:PMSwitch];
}

-(void)timeSwitchChangeAM:(UIButton *)sender{
    if (!sender.selected) {
        sender.selected = YES;
        sender.backgroundColor = flatRed;
        PMSwitch.selected = NO;
        PMSwitch.backgroundColor = flatDarkGray;
        _AMTurnedOn = YES;
        _pickedTimeInterval = 3600*pickedHour+ 60*pickedMinute;
        _pickedTimeIntervalString = [dateComponentsFormatter stringFromTimeInterval:_pickedTimeInterval];
    }
}

-(void)timeSwitchChangePM:(UIButton *)sender{
    if (!sender.selected) {
        sender.selected = YES;
        sender.backgroundColor = flatRed;
        AMSwitch.selected = NO;
        AMSwitch.backgroundColor = flatDarkGray;
        _AMTurnedOn = NO;
        _pickedTimeInterval = 3600*(pickedHour+12) + 60*pickedMinute;
        _pickedTimeIntervalString = [dateComponentsFormatter stringFromTimeInterval:_pickedTimeInterval];
    }
}

-(void)buttonsSetup{
    _confirmButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, pickerViewWidth/2, pickerViewHeight*0.10)];
    _confirmButton.center = CGPointMake(pickerViewWidth/4, pickerViewHeight - _confirmButton.frame.size.height/2);
    [_confirmButton setTitle:@"Done" forState:UIControlStateNormal];
    _confirmButton.backgroundColor = flatDarkGray;
    _confirmButton.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20*sizeRatio];
    [self addSubview:_confirmButton];
    
    _CancelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, pickerViewWidth/2, pickerViewHeight*0.10)];
    _CancelButton.center = CGPointMake(pickerViewWidth*3/4, pickerViewHeight - _CancelButton.frame.size.height/2);
    [_CancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    _CancelButton.backgroundColor = flatDarkGray;
    _CancelButton.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20*sizeRatio];
    [self addSubview:_CancelButton];
}
@end
