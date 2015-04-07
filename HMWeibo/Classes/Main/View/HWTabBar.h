//
//  HWTabBar.h
//  HMWeibo
//
//  Created by mac on 15/4/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HWTabBar;
@protocol HWTabBarDelegate <NSObject>

@optional
-(void)tabBar:(HWTabBar*)tabBar didSelectButtonFrom:(int)form to:(int)to;

@end
@interface HWTabBar : UIView
@property (nonatomic,weak) id<HWTabBarDelegate> delegate;
-(void)addTabBarButtonWithItem:(UITabBarItem *)item;
@end
