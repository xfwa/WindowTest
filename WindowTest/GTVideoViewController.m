//
//  GTVideoViewController.m
//  WindowTest
//
//  Created by SUCHEON on 2023/5/11.
//

#import "GTVideoViewController.h"

@interface GTVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation GTVideoViewController

/*初始化函数*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置view大小
    UICollectionView*collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
//    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width-10)/2, 300);
    //最小行间距
    flowLayout.minimumLineSpacing = 10;
    //最小竖间距
    flowLayout.minimumInteritemSpacing = 10;
    [collectionView registerClass: [UICollectionViewCell class]
       forCellWithReuseIdentifier:@"UIColllectionCell"];
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //回收池中取cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UIColllectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

/**
 对特定的item进行大小的处理
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item%3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    }
    return CGSizeMake((self.view.frame.size.width-10)/2, 300);
}
@end
