//
//  FeatureViewController.m
//  HMWeibo
//
//  Created by mac on 15/4/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FeatureViewController.h"

@interface FeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic ,weak) UIPageControl *pageControl;
@end

@implementation FeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:246 green:246 blue:246 alpha:1.0];
    [self setupScrollow];self.view.backgroundColor = [UIColor colorWithRed:246 green:246 blue:246 alpha:1.0];    [self setuppage];
}

-(void)setuppage
{
    UIPageControl * page = [[UIPageControl alloc]init];
    CGFloat X = self.view.center.x;
    CGFloat Y = self.view.frame.size.height -30;
    page.center = CGPointMake(X, Y);
    page.bounds = CGRectMake(0, 0, 100, 30);
    page.numberOfPages = 3;
    page.currentPage = 0;
    page.currentPageIndicatorTintColor = [UIColor redColor];
    page.pageIndicatorTintColor = [UIColor blackColor];
    
    
    [self.view addSubview:page];
    self.pageControl = page;
    
    
}

-(void)setupScrollow
{
  
    UIScrollView *scrollview = [[UIScrollView alloc]init];
    scrollview.delegate = self;
    scrollview.frame = self.view.bounds;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = scrollview.frame.size.width;
    CGFloat imageH = scrollview.frame.size.height;
    for (int i =0; i<3; i++) {
        NSString *imagename = [NSString stringWithFormat:@"new_feature_%d",i+1];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:imagename];
        imageX = i*imageW;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        [scrollview addSubview:imageView];
    }
    scrollview.contentSize = CGSizeMake(imageW*3, 0);
    scrollview.pagingEnabled = YES;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.bounces = NO;
    [self.view addSubview:scrollview];
}
#pragma mark 实现代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    double doublepage = offsetX/scrollView.frame.size.width;
    int pages = (int)(doublepage +0.5);
    self.pageControl.currentPage = pages;
}


@end
