//
//  ViewController.m
//  导航栏透明
//
//  Created by 孙云 on 16/4/19.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Color.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    UILabel *textLabel;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

//- (UIStatusBarStyle)preferredStatusBarStyle{
//
//    return UIStatusBarStyleLightContent;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    textLabel = [[UILabel alloc]init];
    textLabel.text = @"张三的主页";
    [textLabel sizeToFit];
    textLabel.alpha = 0.0;
    textLabel.hidden = YES;
    self.navigationItem.titleView = textLabel;
    
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , 200)];
    view.backgroundColor = [UIColor redColor];
    _tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    _tableView.tableHeaderView = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * const ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:ID];
    }
    cell.textLabel.text = @"cell";
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat optiy =scrollView.contentOffset.y / 200;
    if(optiy > 1.0){
    
        optiy = 1.0;
    }
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:optiy]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    textLabel.hidden = NO;
    textLabel.alpha = optiy;
    
    if (scrollView.contentOffset.y >= 136) {
            self.navigationController.navigationBar.transform = CGAffineTransformMakeTranslation(0, - scrollView.contentOffset.y + 136);
    }
}
@end
