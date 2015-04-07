//
//  HWNavigationViewController.m
//  HMWeibo
//
//  Created by mac on 15/4/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HWNavigationViewController.h"

@interface HWNavigationViewController ()

@end

@implementation HWNavigationViewController

+(void)initialize
{
    [self setupNavBarTheme];
    [self setupBarButtonTheme];
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
}
+(void)setupBarButtonTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setBackButtonBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackButtonBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [item setBackButtonBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    attr[NSForegroundColorAttributeName] = IOS7?[UIColor orangeColor]:[UIColor blackColor];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
     [item setTitleTextAttributes:attr forState:UIControlStateHighlighted];
}

+(void)setupNavBarTheme
{
    UINavigationBar *navbar = [UINavigationBar appearance];
    if (!IOS7) {
        [navbar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    textAttrs[NSForegroundColorAttributeName]  = [UIColor blackColor];
   //设置阴影
//    NSShadow *shadow = [[NSShadow alloc]init];
//    shadow.shadowColor = [UIColor blackColor];
//    shadow.shadowOffset = CGSizeMake(1, 3);
//    shadow.shadowBlurRadius = 5;
//    textAttrs[NSShadowAttributeName] = shadow;
    [navbar setTitleTextAttributes:textAttrs];
    
    
}

@end
