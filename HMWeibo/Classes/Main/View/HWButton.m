//
//  HWButton.m
//  HMWeibo
//
//  Created by mac on 15/4/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#define  HWTabBarButtonTittleColor (IOS7?[UIColor blackColor]:[UIColor whiteColor])
#define  HWTabBarButtonTittleSelColor (IOS7?[UIColor colorWithRed:234 green:103 blue:10 alpha:0.5]:[UIColor colorWithRed:244 green:133 blue:13 alpha:0.5])
#import "HWButton.h"
#import "HWBadgeButton.h"
@interface HWButton()

@property (nonatomic,weak) HWBadgeButton * badgeButton;
@end


@implementation HWButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:HWTabBarButtonTittleColor forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
//        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        if(!IOS7)
        {
         
         [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        //添加一个提醒数字按钮
        HWBadgeButton *badgebutton = [[HWBadgeButton alloc]init];
        //固定右边和顶部
        badgebutton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgebutton];
        self.badgeButton = badgebutton;
    }
    return self; 
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    self.badgeButton.badgeValue = self.item.badgeValue;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 10;
    CGFloat badgeY = 5;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}
//设置按钮图片的位置大小
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height*0.6);
}
//设置按钮标题的位置大小
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return  CGRectMake(0, contentRect.size.height * 0.6, contentRect.size.width,contentRect.size.height*0.4 );
}
-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

@end
