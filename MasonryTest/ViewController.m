//
//  ViewController.m
//  MasonryTest
//
//  Created by 林信成 on 2016/4/18.
//  Copyright © 2016年 林信成. All rights reserved.
//
// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS
#define LXZViewPadding 20
#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
@property (nonatomic, strong)UIView *yellowView;
@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIView *greenView;
@property (nonatomic, strong)UIView *redView;
@property (nonatomic, strong)UIView *containerView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.yellowView = [[UIView alloc] initWithFrame:CGRectZero];
    [_yellowView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.yellowView];

    
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.numberOfLines = 0;
    [self.view addSubview:self.textLabel];
    
    /**
     设置yellow视图和self.view等大，并且有10的内边距。
     注意根据UIView的坐标系，下面right和bottom进行了取反。所以不能写成下面这样，否则right、bottom这两个方向会出现问题。
     make.edges.equalTo(self.view).with.offset(10);
     
     除了下面例子中的offset()方法，还有针对不同坐标系的centerOffset()、sizeOffset()、valueOffset()之类的方法。
     */
//    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make)
//    {
//        make.left.equalTo(self.view).with.offset(10);
//        make.right.equalTo(self.view).with.offset(-10);
//        make.top.equalTo(self.view).with.offset(10);
//        make.bottom.equalTo(self.view).with.offset(-10);
//        
//    }];
    
//    // 下面的方法和上面例子等价，区别在于使用insets()方法。
//    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        // 下、右不需要写负号，insets方法中已经为我们做了取反的操作了。
//        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
    
    // 设置greenView的center和size，这样就可以达到简单进行约束的目的
//    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        // 这里通过mas_equalTo给size设置了基础数据类型的参数，参数为CGSize的结构体
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//    }];
//    
//    // 为了更清楚的看出约束变化的效果，在显示两秒后更新约束。
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.yellowView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.view).with.offset(100);
//            make.size.mas_equalTo(CGSizeMake(100, 100));
//        }];
//    });
//    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make)
//    {
//        make.center.equalTo(CGPointMake(100, 100));
//        // 设置宽度小于等于200
//        make.width.lessThanOrEqualTo(@200);
//        // 设置高度大于等于10
//        make.height.greaterThanOrEqualTo(@(10));
//    }];
//    
//    self.textLabel.text = @"这是测试的字符串。能看到1、2、3个步骤，第一步当然是上传照片了，要上传正面近照哦。上传后，网站会自动识别你的面部，如果觉得识别的不准，你还可以手动修改一下。左边可以看到16项修改参数，最上面是整体修改，你也可以根据自己的意愿单独修改某项，将鼠标放到选项上面，右边的预览图会显示相应的位置。";
    
//    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.width.equalTo(self.view).priorityLow();
//        make.width.mas_equalTo(20).priorityHigh();
//        make.height.equalTo(self.view).priority(200);
//        make.height.mas_equalTo(100).priority(1000);
//    }];
    // 在进行约束的时候，要对containerView的上下左右都添加和子视图的约束，以便确认containerView的边界区域。
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 400, 300)];
    self.containerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.containerView.backgroundColor = [UIColor grayColor];
    
    self.redView = [[UIView alloc] initWithFrame:CGRectZero];
    self.redView.backgroundColor = [UIColor redColor];
    
    
    self.yellowView = [[UIView alloc] initWithFrame:CGRectZero];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    
    self.greenView = [[UIView alloc] initWithFrame:CGRectZero];
    self.greenView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.containerView];
    
    // 在进行约束的时候，要对containerView的上下左右都添加和子视图的约束，以便确认containerView的边界区域。
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    CGFloat padding = LXZViewPadding;
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView).insets(UIEdgeInsetsMake(padding, padding, padding, padding));
    }];
    
    [self.containerView addSubview:self.greenView];
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.containerView).offset(padding);
        make.size.mas_equalTo(CGSizeMake(250, 250));
    }];
    
    [self.containerView addSubview:self.redView];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView).offset(padding);
        make.left.equalTo(self.greenView.mas_right).offset(padding);
        make.size.equalTo(self.greenView);
        make.right.equalTo(self.containerView).offset(-padding);
    }];
    
    [self.containerView addSubview:self.yellowView];
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.containerView).offset(padding);
        make.top.equalTo(self.greenView.mas_bottom).offset(padding);
        make.size.equalTo(self.greenView);
        make.bottom.equalTo(self.containerView).offset(-padding);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
