//
//  ViewController.m
//  XMCMediator
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 xmc. All rights reserved.
//

#import "ViewController.h"
#import "XMCMediator+CTMediatorModuleAActions.h"

NSString * const  kCellIdentifier = @"kCellIdentifier";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            UIViewController * viewController = [[XMCMediator sharedInstance] CTMediator_viewControllerForDetail];
            //获得view controller 之后，在这种场景下，到底是push，还是present, 其实是由使用者决定的，meidator只给出viewController的实例就好了
            [self presentViewController:viewController animated:YES completion:nil];
        }
            break;
        case 1:
        {
            UIViewController * viewController = [[XMCMediator sharedInstance] CTMediator_viewControllerForDetail];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case  2:
        {
            //这种场景下很明显是需要present的，所以不必返回实例，midiator直接present了
            [[XMCMediator sharedInstance] CTMediator_presentImage:[UIImage imageNamed:@"image"]];
        }
            break;
        case 3:
        {
            //这种场景下，参数有问题，因此需要在流程中做好处理
            [[XMCMediator sharedInstance] CTMediator_presentImage:nil];
        }
            break;
        case 4:
        {
            [[XMCMediator sharedInstance] CTMediator_showAlertWithMessage:@"caca" cancelAction:nil confirmAction:^(NSDictionary *info) {
                //做你想做的事情
                NSLog(@"%@",info);
            }];
        }
            break;
        default:
            break;
    }
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    return _tableView;
}

- (NSArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = @[@"present detail view controller",@"push detail view controller",@"present image",@"present image when error",@"show alert"];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
