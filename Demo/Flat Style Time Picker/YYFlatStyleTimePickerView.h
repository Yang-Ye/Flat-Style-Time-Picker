//
//  YYFlatStyleTimePickerView.h
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYRoundTimePicker.h"

@interface YYFlatStyleTimePickerView : UIView
@property(nonatomic,assign)NSTimeInterval pickedTimeInterval;
@property(nonatomic,strong)NSString *pickedTimeIntervalString;
@property(nonatomic,assign)BOOL AMTurnedOn;
@property(nonatomic,strong)UIButton *confirmButton;
@property(nonatomic,strong)UIButton *CancelButton;

-(instancetype)initWithWidth:(CGFloat)width;
@end
