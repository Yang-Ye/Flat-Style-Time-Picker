//
//  YYFlatSwith.m
//  Flat Style Time Picker
//
//  Created by Yang Ye on 12/17/15.
//  Copyright © 2015 YY. All rights reserved.
//

#import "YYFlatSwitch.h"

@implementation YYFlatSwitch

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //Default switch background color
        UIColor* grayColor = [UIColor colorWithRed: 0.349 green: 0.341 blue: 0.341 alpha: 1];
        //Restrict the width of the switch to be twice of the height, here I always take the user defined width and divieded it by 2 to get the swith frame height.
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.width/2);
        //Since the ratio of the width and height is restricted to be 2:1, then the corner radius for make a rounded corner will always be the half of the height.
        self.layer.cornerRadius = self.frame.size.height/2;
        self.backgroundColor = grayColor;
        
        //Default switch button color
        UIColor* redColor = [UIColor colorWithRed: 0.931 green: 0.43 blue: 0.43 alpha: 1];
        _roundButton = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
        _roundButton.layer.cornerRadius = _roundButton.frame.size.width/2;
        _roundButton.backgroundColor = redColor;
        _roundButton.userInteractionEnabled = NO;
        [self addSubview:_roundButton];
        _on = NO;
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if (!_on) {
        [UIView animateWithDuration:0.3 animations:^{
            _roundButton.layer.position = CGPointMake(self.frame.size.width*3/4, _roundButton.layer.position.y);
        } completion:nil];
    }
    else{
        [UIView animateWithDuration:0.3 animations:^{
            _roundButton.layer.position = CGPointMake(self.frame.size.width*1/4, _roundButton.layer.position.y);
        } completion:nil];
    }
    _on = !_on;
}

-(void)setOn:(BOOL)on{
    if (_on != on) {
        if (!_on) {
            _roundButton.layer.position = CGPointMake(self.frame.size.width*3/4, _roundButton.layer.position.y);
        }
        else{
            _roundButton.layer.position = CGPointMake(self.frame.size.width*1/4, _roundButton.layer.position.y);
        }
        _on = on;
    }
}

-(void)setOn:(BOOL)on withAnimation:(BOOL)animation{
    if (animation) {
        if (_on != on) {
            if (!_on) {
                [UIView animateWithDuration:0.3 animations:^{
                    _roundButton.layer.position = CGPointMake(self.frame.size.width*3/4, _roundButton.layer.position.y);
                } completion:nil];
            }
            else{
                [UIView animateWithDuration:0.3 animations:^{
                    _roundButton.layer.position = CGPointMake(self.frame.size.width*1/4, _roundButton.layer.position.y);
                } completion:nil];
            }
            _on = on;
        }
    }
    else{
        if (_on != on) {
            if (!_on) {
                _roundButton.layer.position = CGPointMake(self.frame.size.width*3/4, _roundButton.layer.position.y);
            }
            else{
                _roundButton.layer.position = CGPointMake(self.frame.size.width*1/4, _roundButton.layer.position.y);
            }
            _on = on;
        }
        
    }
}
@end
