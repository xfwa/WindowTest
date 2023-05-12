//
//  AppDelegate.m
//  WindowTest
//
//  Created by SUCHEON on 2023/5/9.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"

@interface AppDelegate()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    ViewController *viewController1 = [[ViewController alloc]init];
//    viewController1.view.backgroundColor = [UIColor redColor];
    viewController1.tabBarItem.title = @"新闻";
    //指向delegate
    tabBarController.delegate = self;
    GTVideoViewController *videoController = [[GTVideoViewController alloc]init];
    
    GTRecommendViewController *recommendVC = [[GTRecommendViewController alloc]init];
    
    UIViewController *viewController4 = [[UIViewController alloc]init];
    viewController4.tabBarItem.title = @"我的";
    viewController4.view.backgroundColor = [UIColor blueColor];
    
    //将创建的viewController添加到UITabBarController
    [tabBarController setViewControllers:@[viewController1,videoController,recommendVC,viewController4]];
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    self.window.rootViewController = navigation;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"点击了底部标题");
}

@end
