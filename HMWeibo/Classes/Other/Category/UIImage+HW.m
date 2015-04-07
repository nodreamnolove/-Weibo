//
//  UIImage+HW.m
//  HMWeibo
//
//  Created by mac on 15/4/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "UIImage+HW.h"

@implementation UIImage (HW)
+(instancetype)imageWithName:(NSString *)imageName
{
    if (IOS7) {
        NSString *newname = [imageName stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newname];
        if (image == nil) {
            image = [UIImage imageNamed:imageName];
        }
        return image;
    }
    
    return [UIImage imageNamed:imageName];
}
+(instancetype)resizedImageWithName:(NSString *)name
{
    UIImage * image = [self imageWithName:name];
    return  [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height *0.5];
}


@end
