//
//  YYRoundTimePickerValueLabel.m
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//
#define DEFAULTPICKERVIEWWIDTH 38

#import "YYRoundTimePickerValueButton.h"

@implementation YYRoundTimePickerValueButton

-(instancetype)initWithFrame:(CGRect)frame withValue:(double)value{
    self = [super init];
    if (self) {
        float sizeRatio = frame.size.width/DEFAULTPICKERVIEWWIDTH;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.width);
        self.layer.cornerRadius = frame.size.width/2;
        [self setTitle:[NSString stringWithFormat:@"%02d",(int)value] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:23*sizeRatio];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.value = value;
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
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UIColor* flatRed = [UIColor colorWithRed: 0.931 green: 0.43 blue: 0.43 alpha: 1];
//    if (self.selected) {
//        self.backgroundColor = flatRed;
//    }
//    else{
//        self.backgroundColor = [UIColor grayColor];
//    }
//    self.selected = !self.selected;
//}

@end
