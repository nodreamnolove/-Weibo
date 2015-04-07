//
//  HWBadgeButton.m
//  HMWeibo
//
//  Created by mac on 15/4/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HWBadgeButton.h"

@implementation HWBadgeButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage resizedImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    
    return self;
}


-(void)setBadgeValue:(NSString *)badgeValue
{
#warning copy
    _badgeValue = [badgeValue copy];
    if (badgeValue.length!=nil) {
        self.hidden = NO; //存在值 不隐藏
        [self setTitle:badgeValue forState:UIControlStateNormal];
        CGRect frame = self.frame;
        
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        if (badgeValue.length >1) {
            NSDictionary *dict = @{NSFontAttributeName:self.titleLabel.font};
            CGSize badgeSize = [badgeValue sizeWithAttributes:dict];
            badgeW = badgeSize.width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;    }
    else
    {
        self.hidden = YES;
    }
}

@end
