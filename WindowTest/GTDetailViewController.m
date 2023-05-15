//
//  GTDetailViewController.m
//  WindowTest
//
//  Created by SUCHEON on 2023/5/15.
//

#import "GTDetailViewController.h"
#import "WebKit/WebKit.h"

@interface GTDetailViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite)WKWebView*webView;
@property(nonatomic,strong,readwrite)UIProgressView*progressView;
@end

@implementation GTDetailViewController

//移除监听
-(void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化webView
    [self.view addSubview:({
        self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, self.view.bounds.size.height-88)];
        self.webView;
    })];
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 20)];
        self.progressView.progressTintColor = [UIColor greenColor];
        self.progressView;
    })];
    //加载对应的网址
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    self.webView.navigationDelegate = self;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"页面加载完成");
}

//问我们是否加载这个url
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"是否加载这个url");
    //WKNavigationActionPolicyAllow允许加载这个url
    decisionHandler(WKNavigationActionPolicyAllow);
    //监听webView的estimatedProgress属性,当有新变化的时候告诉我们
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    NSLog(@"当前进度:%f" ,self.webView.estimatedProgress);
    self.progressView.progress =self.webView.estimatedProgress;
}

@end
