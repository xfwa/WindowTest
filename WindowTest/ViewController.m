//
//  ViewController.m
//  WindowTest
//
//  Created by SUCHEON on 2023/5/9.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
/*cell的个数*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 200;
}
int i = 0;
/**/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //先从回收池取
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    //没取到就创建一个新的
    
    if (!cell) {
        i++;
        NSLog(@"创建cell,第%d个",i);
        cell = [[GTNormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    //cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@", @(indexPath.row)];
    //@(indexPath.row) 拿到对应的下标
//    cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@", @(indexPath.row)];
//    cell.detailTextLabel.text = @"副标题";
    [cell layoutTabViewCell];
    return cell;
}

#pragma mark - UITableViewDelegate
/*更改item的高度*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

/*item的点击事件*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"item点击了");
    UIViewController*controller = [[UIViewController alloc]init];
    controller.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
