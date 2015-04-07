//
//  HWTabBarViewController.m
//  HMWeibo
//
//  Created by mac on 15/4/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HWTabBarViewController.h"
#import "HWHomeViewController.h"
#import "HWMessageViewController.h"
#import "HWDiscoverViewController.h"
#import "HWMeViewController.h"
#import "HWNavigationViewController.h"

#import "HWTabBar.h"

@interface HWTabBarViewController ()<HWTabBarDelegate>

@property (nonatomic, weak)HWTabBar *customTabBar;
@end

@implementation HWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setupTabBar];
    
    [self setUpAllChildController];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
-(void)setupTabBar
{
    HWTabBar *customtabBar = [[HWTabBar alloc]init];
//    customtabBar.backgroundColor = [ UIColor redColor];
    customtabBar.frame = self.tabBar.bounds;
    customtabBar.delegate = self;
    [self.tabBar addSubview:customtabBar];
    self.customTabBar = customtabBar;
}

-(void)setUpAllChildController
{
    HWHomeViewController *home = [[HWHomeViewController alloc]init];
    [self setUpChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
//    home.tabBarItem.badgeValue = @"100";
//    home.tabBarItem.title = @"HHH";
    
    
    HWMessageViewController *message = [[HWMessageViewController alloc]init];
    [self setUpChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    HWDiscoverViewController *discover = [[HWDiscoverViewController alloc]init];
    [self setUpChildViewController:discover title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    
    HWMeViewController *me = [[HWMeViewController alloc]init];
    [self setUpChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    
    
    //    self.viewControllers = @[homenav,messagenav,discovernav,menav];
}
-(void)setUpChildViewController:(UIViewController*) childvc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    childvc.title = title;
    childvc.tabBarItem.badgeValue = @"";
    childvc.tabBarItem.image = [UIImage imageWithName:imageName];
    childvc.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    HWNavigationViewController *nav = [[HWNavigationViewController alloc]initWithRootViewController:childvc];
    [self addChildViewController:nav];
    
    [self.customTabBar addTabBarButtonWithItem:childvc.tabBarItem];

}

#pragma mark 代理方法
-(void)tabBar:(HWTabBar *)tabBar didSelectButtonFrom:(int)form to:(int)to
{
    self.selectedIndex = to;
}

@end
