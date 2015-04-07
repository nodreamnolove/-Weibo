//
//  HWTabBar.m
//  HMWeibo
//
//  Created by mac on 15/4/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HWTabBar.h"

#import "HWButton.h"
@interface HWTabBar()

@property (nonatomic ,weak)UIButton * selectedButton;
@property (nonatomic,weak)UIButton *plusButton;
@property (nonatomic, strong) NSMutableArray *buttons;
@end


@implementation HWTabBar

-(NSMutableArray *)buttons
{
    if (_buttons==nil) {
        _buttons = [NSMutableArray array];
    }
    
    return _buttons;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!IOS7) {
             self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
        
    }
    
    UIButton *plusbutton = [[UIButton alloc]init];
    [plusbutton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusbutton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [plusbutton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusbutton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    plusbutton.bounds = CGRectMake(0, 0, plusbutton.currentBackgroundImage.size.width, plusbutton.currentBackgroundImage.size.height);
    
    [self addSubview:plusbutton];
    self.plusButton = plusbutton;
    return self;
}



-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
     NSLog(@"addTabBarButtonWithItem---");
    HWButton *button = [[HWButton alloc]init];
    
    [self addSubview:button];
    button.item = item;
   
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    if (self.buttons.count == 0) {
        [self buttonClick:button];
    }
    [self.buttons addObject:button];
}


-(void)buttonClick:(UIButton*) button
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
   
    
}
-(void)layoutSubviews
{
    NSLog(@"layoutSubviews---");
    [super layoutSubviews];
    self.plusButton.center = CGPointMake(self.frame.size.width*0.5,self.frame.size.height*0.5);
    
    
    float buttonY = 0;
    float buttonW = self.frame.size.width/self.subviews.count;
    float buttonH = self.frame.size.height;
    for (int index =0 ; index<self.buttons.count; index++) {
        HWButton *button = self.buttons[index];
        button.tag = index;
         float buttonX = index*buttonW;
        if (index>1) {
            buttonX += buttonW;
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
    
}

@end
