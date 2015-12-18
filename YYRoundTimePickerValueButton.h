//
//  YYRoundTimePickerValueLabel.h
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYRoundTimePickerValueButton : UIButton
@property(nonatomic,assign)double value;
-(instancetype)initWithFrame:(CGRect)frame withValue:(double)value;
@end
