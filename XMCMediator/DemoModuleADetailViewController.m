//
//  DemoModuleADetailViewController.m
//  XMCMediator
//
//  Created by mac on 16/10/14.
//  Copyright © 2016年 xmc. All rights reserved.
//

#import "DemoModuleADetailViewController.h"

@interface DemoModuleADetailViewController ()

@property (nonatomic, strong, readwrite) UILabel * valueLabel;
@property (nonatomic, strong, readwrite) UIImageView * imageView;

@property (nonatomic, strong) UIButton * returnButton;

@end

@implementation DemoModuleADetailViewController

#pragma mark- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.valueLabel];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.returnButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (UILabel *)valueLabel
{
    if (!_valueLabel)
    {
        _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
        _valueLabel.textColor = [UIColor magentaColor];
        _valueLabel.font = [UIFont systemFontOfSize:16];
    }
    return _valueLabel;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UIButton *)returnButton
{
    if (!_returnButton)
    {
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnButton setTitle:@"return" forState:UIControlStateNormal];
        [_returnButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _returnButton.frame = CGRectMake(100, 350, 100, 50);
        _returnButton.layer.cornerRadius = 5;
        _returnButton.layer.borderColor = [UIColor redColor].CGColor;
        _returnButton.layer.borderWidth = 2;
        [_returnButton addTarget:self action:@selector(didTappedReturnButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnButton;
}

- (void)didTappedReturnButton:(UIButton *)button
{
    if (self.navigationController == nil)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


@end
