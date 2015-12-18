//
//  YYFlatSwith.h
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYFlatSwitch : UIControl
@property(nonatomic,assign)BOOL on;
@property(nonatomic,strong,getter = isOn)UIView *roundButton;

-(void)setOn:(BOOL)on withAnimation:(BOOL)animation;
@end
