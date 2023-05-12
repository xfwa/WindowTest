//
//  GTNormalTableViewCell.m
//  WindowTest
//
//  Created by SUCHEON on 2023/5/12.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell()
@property(nonatomic,strong,readwrite) UILabel *titleLable;
@property(nonatomic,strong,readwrite) UILabel *sourceLable;
@property(nonatomic,strong,readwrite) UILabel *commentable;
@property(nonatomic,strong,readwrite) UILabel *timeLable;

@property(nonatomic,strong,readwrite) UIImageView *rightImageView;
@property(nonatomic,strong,readwrite) UIButton *deleteButton;

@end

@implementation GTNormalTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLable =[[UILabel alloc]initWithFrame: CGRectMake(20, 15, 300, 50)];
//            self.titleLable.backgroundColor = [UIColor redColor];
            //设置字体和文本大小
            self.titleLable.font = [UIFont systemFontOfSize:16];
            self.titleLable.textColor = [UIColor blackColor];
            self.titleLable;
        })];
    
        [self.contentView addSubview:({
            self.sourceLable =[[UILabel alloc]initWithFrame: CGRectMake(20, 80, 50, 20)];
//            self.sourceLable.backgroundColor = [UIColor redColor];
            //设置字体和文本大小
            self.sourceLable.font = [UIFont systemFontOfSize:12];
            self.sourceLable.textColor = [UIColor grayColor];
            self.sourceLable;
        })];
        
        [self.contentView addSubview:({
            self.commentable =[[UILabel alloc]initWithFrame: CGRectMake(100, 80, 50, 20)];
//            self.commentable.backgroundColor = [UIColor redColor];
            //设置字体和文本大小
            self.commentable.font = [UIFont systemFontOfSize:12];
            self.commentable.textColor = [UIColor grayColor];
            self.commentable;
        })];
        
        [self.contentView addSubview:({
            self.timeLable =[[UILabel alloc]initWithFrame: CGRectMake(170, 80, 50, 20)];
//            self.timeLable.backgroundColor = [UIColor redColor];
            //设置字体和文本大小
            self.timeLable.font = [UIFont systemFontOfSize:12];
            self.timeLable.textColor = [UIColor lightGrayColor];
            self.timeLable;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc]initWithFrame: CGRectMake(308, 15, 60, 60)];
            self.rightImageView.backgroundColor = [UIColor redColor];
//            self.rightImageView.contentMode = 设置图片的展示模式
            self.rightImageView;
        })];
        
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc]initWithFrame: CGRectMake(308, 320, 30, 30)];
//            self.deleteButton.backgroundColor = [UIColor blueColor];
            //action:@selector(deleteButtolClick)其中 deleteButtonClick是我们自定义的方法
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton;
        })];
        
    };
    return self;
}

-(void)deleteButtonClick{
    NSLog(@"点击删除");
}

-(void)layoutTabViewCell{
    self.titleLable.text = @"极客时间iOS开发";
    self.sourceLable.text = @"极客时间";
    [self.sourceLable sizeToFit];
    self.commentable.text = @"18888评论";
    self.commentable.frame = CGRectMake(self.sourceLable.frame.origin.x + self.sourceLable.frame.size.width + 15,80, 0, 0);
    [self.commentable sizeToFit];
    
    self.timeLable.text = @"2023/05/12";
    self.timeLable.frame = CGRectMake(self.commentable.frame.origin.x + self.commentable.frame.size.width + 15,80 , 0, 0);
    [self.timeLable sizeToFit];
    
    self.deleteButton.frame = CGRectMake(308, self.rightImageView.frame.origin.y+self.rightImageView.frame.size.height + 5, 10, 10);
    //设置图片资源
//    self.rightImageView.image = [UIImage imageNamed:@""];
//    self.deleteButton addSubview:<#(nonnull UIView *)#>
    //普通的样式
    [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
    //点击的样式
    [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
    //设置标题颜色
    [self.deleteButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];

}

@end
