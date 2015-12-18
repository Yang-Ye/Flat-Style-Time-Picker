//
//  YYRoundTimePicker.h
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "YYRoundTimePickerValueButton.h"

typedef enum : NSUInteger {
    YYRoundTimePickerHour,
    YYRoundTimePickerMinute,
} YYRoundTimePickerType;


@interface YYRoundTimePicker : UIView
@property(nonatomic,assign)NSTimeInterval pickedTimeInterva;
@property(nonatomic,assign)YYRoundTimePickerType type;
@end
