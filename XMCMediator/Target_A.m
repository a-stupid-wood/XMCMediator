//
//  Target_A.m
//  XMCMediator
//
//  Created by mac on 16/10/14.
//  Copyright © 2016年 xmc. All rights reserved.
//

#import "Target_A.h"
#import "DemoModuleADetailViewController.h"

typedef void(^CTUrlRouterCallbackBlock)(NSDictionary * info);

@implementation Target_A

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params
{
    //因为action是从属于ModuleA的，所以action直接可以使用ModuleA里的所有声明
    DemoModuleADetailViewController * viewController = [[DemoModuleADetailViewController alloc] init];
    viewController.valueLabel.text = params[@"key"];
    return viewController;
}

- (id)Action_nativePresentImage:(NSDictionary *)params
{
    DemoModuleADetailViewController * viewController = [[DemoModuleADetailViewController alloc] init];
    viewController.valueLabel.text = @"this is image";
    viewController.imageView.image = params[@"image"];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewController animated:YES completion:nil];
    return nil;
}

- (id)Action_showAlert:(NSDictionary *)params
{
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        CTUrlRouterCallbackBlock callBack = params[@"cancelAction"];
        if(callBack)
        {
            callBack(@{@"alertAction" : action});
        }
    }];
    UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        CTUrlRouterCallbackBlock callback = params[@"confirmAction"];
        if(callback)
        {
            callback(@{@"alertAction" : action});
        }
    }];
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"alert from ModuleA" message:params[@"message"] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    return  nil;
}

- (id)Action_nativeNoImage:(NSDictionary *)params
{
    DemoModuleADetailViewController * viewController = [[DemoModuleADetailViewController alloc] init];
    viewController.valueLabel.text = @"no image";
    viewController.imageView.image = [UIImage imageNamed:@"noImage"];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewController animated:YES completion:nil];
    return nil;
}

@end
