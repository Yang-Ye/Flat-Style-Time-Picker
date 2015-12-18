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
        
        for (int x = 1; x <= 12; x++) {
            YYRoundTimePickerValueButton *valueButton = [[YYRoundTimePickerValueButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.14, self.frame.size.width*0.14) withValue:x];
            valueButton.layer.anchorPoint = CGPointMake(0.5, 0.5);
            valueButton.layer.position = CGPointMake(self.center.x,valueButton.frame.size.width/2*1.2);
            //NSLog(@"%f",valueButton.frame.size.width);
            CGAffineTransform t = CGAffineTransformMakeTranslation(0, self.center.y - valueButton.frame.size.width/2*1.2);
            t = CGAffineTransformRotate(t, M_PI_2/3*x);
            t = CGAffineTransformTranslate(t, 0, -self.center.y + valueButton.frame.size.width/2*1.2);
            t = CGAffineTransformRotate(t, -M_PI_2/3*x);
            valueButton.transform = t;
            valueButton.value = x;
            [self addSubview:valueButton];
        }
    }
    return  self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setPickerType:(YYRoundTimePickerType)pickerType{
    if (self.type != pickerType) {
        self.type = pickerType;
        switch (pickerType) {
            case YYRoundTimePickerMinute:{
                for (YYRoundTimePickerValueButton *button in self.subviews) {
                    if (button) {
                        [UIView animateWithDuration:0.15 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
                            button.transform = CGAffineTransformMakeScale(0.1, 0.1);
                        } completion:^(BOOL finished) {
                            if (button.value == 12) {
                                button.value = 0;
                            }
                            else{
                                button.value = button.value *5;
                            }
                            [button setTitle:[NSString stringWithFormat:@"%0.0f",button.value] forState:UIControlStateNormal];
                            [UIView animateWithDuration:0.15 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
                             button.titleLabel.transform = CGAffineTransformMakeScale( 1, 1);
                            } completion:nil];
                        }];
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
                        [button setTitle:[NSString stringWithFormat:@"%0.0f",button.value] forState:UIControlStateNormal];
                    }
                }
            }
                break;
        }
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setPickerType:YYRoundTimePickerMinute];
}
@end
