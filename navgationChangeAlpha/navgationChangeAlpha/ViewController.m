//
//  ViewController.m
//  navgationChangeAlpha
//
//  Created by Secret Wang on 2016/10/12.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "ViewController.h"
#import "PrefixHeader.pch"



@interface ViewController ()
{
    UITableView* myTableView;
    UIView* view;
    CGFloat alpha;
    BOOL is;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationItem.title = @"标题";
    [self initTableView];
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 20)];
    view.alpha = 0;
    [self.view addSubview:view];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[self tableViewZ:self->myTableView cellForRowAtIndexPath:indexPath];
    return cell;
}
- (UITableViewCell *)tableViewZ:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]init];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //状态栏
    UIColor *color=[UIColor redColor];
    CGFloat offset = scrollView.contentOffset.y;
    if (offset <= -64) {
        //标题颜色
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
        self.navigationController.navigationBar.backgroundColor = [color colorWithAlphaComponent:0];
        view.backgroundColor = color;
        is = NO;
        [self setNeedsStatusBarAppearanceUpdate];
    }else {
        alpha = 1 - ((-offset)/64);
        self.navigationController.navigationBar.backgroundColor=[color colorWithAlphaComponent:alpha];
        view.alpha = alpha;
        is = YES;
        if (alpha >= 1) {
            //标题颜色
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
            //导航栏子控件颜色
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
            [self setNeedsStatusBarAppearanceUpdate];
        }
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return is;
}
- (void)initTableView{
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 600) style:UITableViewStylePlain];
    myTableView.delegate=self;
    myTableView.dataSource=self;
    [self.view addSubview:myTableView];
}

@end
