//
//  UIBarButtonItem+HW.h
//  HMWeibo
//
//  Created by mac on 15/4/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HW)
+(UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

@end
