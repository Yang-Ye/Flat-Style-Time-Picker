//
//  YYRoundTimePicker.m
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//

#import "YYRoundTimePicker.h"

@implementation YYRoundTimePicker

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.width);
        self.layer.cornerRadius = self.frame.size.width/2;
        UIColor* flatGray = [UIColor colorWithRed: 0.349 green: 0.341 blue: 0.341 alpha: 1];
        self.backgroundColor = flatGray;
        self.type = YYRoundTimePickerHour;
        _valueButtonArray = [[NSMutableArray alloc]init];
        for (int x = 1; x <= 12; x++) {
            YYRoundTimePickerValueButton *valueButton = [[YYRoundTimePickerValueButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.14, self.frame.size.width*0.14) withValue:x];
            valueButton.layer.anchorPoint = CGPointMake(0.5, 0.5);
            valueButton.layer.position = CGPointMake(self.center.x,valueButton.frame.size.width/2*1.2);
            CGAffineTransform t = CGAffineTransformMakeTranslation(0, self.center.y - valueButton.frame.size.width/2*1.2);
            t = CGAffineTransformRotate(t, M_PI_2/3*x);
            t = CGAffineTransformTranslate(t, 0, -self.center.y + valueButton.frame.size.width/2*1.2);
            t = CGAffineTransformRotate(t, -M_PI_2/3*x);
            valueButton.transform = t;
            valueButton.tag = x;
            [self addSubview:valueButton];
            [_valueButtonArray addObject:valueButton];
        }
    }
    return  self;
}



-(void)setPickerType:(YYRoundTimePickerType)pickerType{
    if (self.type != pickerType) {
        self.type = pickerType;
        switch (pickerType) {
            case YYRoundTimePickerMinute:{
                for (YYRoundTimePickerValueButton *button in self.subviews) {
                    if (button) {
                        if (button.value == 12) {
                            button.value = 0;
                        }
                        else{
                            button.value = button.value * 5;
                        }
                        [button setTitle:[NSString stringWithFormat:@"%02d",(int)button.value] forState:UIControlStateNormal];
                    }
                }
            }
                break;
                
            default:{
                for (YYRoundTimePickerValueButton *button in self.subviews) {
                    if (button) {
                        if (button.value == 0) {
                            button.value = 12;
                        }
                        else{
                            button.value = button.value / 5;
                        }
                        [button setTitle:[NSString stringWithFormat:@"%02d",(int)button.value] forState:UIControlStateNormal];
                    }
                }
            }
                break;
        }
    }
}
@end
