//
//  PageViewController.m
//  LWBScrollerViewTest
//
//  Created by mac on 2020/1/2.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "PageViewController.h"



@interface PageViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *contentList;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

#define pageControlHeight 70

@implementation PageViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *firstImage = [mainBundle pathForResource:@"first" ofType:@"jpeg"];
    NSString *secondImage = [mainBundle pathForResource:@"second" ofType:@"jpeg"];
    NSString *thirdImage = [mainBundle pathForResource:@"Third" ofType:@"jpeg"];
    NSString *forthImage = [mainBundle pathForResource:@"Forth" ofType:@"jpg"];
    self.contentList = @[firstImage,secondImage,thirdImage,forthImage];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
    self.view.backgroundColor = [UIColor blackColor];
    // 3.为scrollView每一页添加图片
    for (NSUInteger i=0; i<self.contentList.count; ++i) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.scrollView.frame) * i, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = [UIImage imageNamed:self.contentList[i]];
        [self.scrollView addSubview:imageView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    NSUInteger page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, pageControlHeight, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 2*pageControlHeight)];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * self.contentList.count, CGRectGetHeight(self.view.frame) - 2*pageControlHeight);
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - pageControlHeight, CGRectGetWidth(self.view.frame), pageControlHeight)];
        _pageControl.numberOfPages = self.contentList.count;
        _pageControl.currentPage = 0;
        [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:(UIControlEventValueChanged)];
    }
    return _pageControl;
}

- (void)changePage:(id)sener {
    NSUInteger page = self.pageControl.currentPage;
    CGRect bounds = self.scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = self.scrollView.frame.origin.y;
    [self.scrollView scrollRectToVisible:bounds animated:YES];
}

@end
