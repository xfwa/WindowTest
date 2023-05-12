//
//  GTRecommendViewController.m
//  WindowTest
//
//  Created by SUCHEON on 2023/5/11.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation GTRecommendViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    scrollView.backgroundColor = [UIColor lightGrayColor];
    NSArray *colorArry = @[[UIColor redColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor],[UIColor orangeColor]];
    for (int i =0; i<5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc]initWithFrame: CGRectMake(scrollView.bounds.size.width*i, 0,
                                                                    scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = [colorArry objectAtIndex:i];
            [view addSubview:({
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 200)];
                view.backgroundColor = [UIColor yellowColor];
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewClick)];
                tapGesture.delegate = self;
                [view addGestureRecognizer:tapGesture];
                view;
            })];
            view;
        })];
    }
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
}

/**
 设置是否需要执行当前的手势
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    //NO不执行 YES执行
//    return NO;
    return YES;
}

-(void)viewClick{
    NSLog(@"viewClick");
}

//滚动，监听页面滚动，以及根据offset做业务逻辑
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"scrollViewDidScroll,y offset->%@,x offset->%@",@(scrollView.contentOffset.y),@(scrollView.contentOffset.x));
}

//开始拖拽，中断一些业务逻辑。比如视频/gif拖放
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //NSLog(@"开始拖拽");
}

//结束拖拽，同上
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //NSLog(@"结束拖拽");
}

//减速开始
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"减速开始");
}

//减速结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"减速结束");
}

@end
