//
//  YYFlatStyleTimePickerView.h
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYRoundTimePicker.h"

@protocol  YYFlatStyleTimePickerViewDelegate;

@interface YYFlatStyleTimePickerView : UIView
@property(nonatomic,assign)NSTimeInterval pickerTimeInterval;
@property(nonatomic,strong)UIButton *confirmButton;
@property(nonatomic,strong)UIButton *CancelButton;
@property(nonatomic,assign)float hourDisplayLabelFont;
@property(nonatomic,assign)float minuteDisplayLabelFont;

-(instancetype)initWithWidth:(CGFloat)width;
@end

@protocol YYFlatStyleTimePickerViewDelegate <NSObject>

@end