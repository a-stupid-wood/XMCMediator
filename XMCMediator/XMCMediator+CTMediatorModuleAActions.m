//
//  XMCMediator+CTMediatorModuleAActions.m
//  XMCMediator
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 xmc. All rights reserved.
//

#import "XMCMediator+CTMediatorModuleAActions.h"

NSString * const kCTMediatorTargetA = @"A";

NSString * const kCTMediatorActionNativeFetchDetailViewController = @"nativeFetchDetailViewController";
NSString * const kCTMediatorActionNativePresentImage = @"nativePresentImage";
NSString * const kCTMediatorActionNativeNoImage = @"nativeNoImage";
NSString * const kCTMediatorActionNativeShowAlert = @"showAlert";

@implementation XMCMediator (CTMediatorModuleAActions)

- (UIViewController *)CTMediator_viewControllerForDetail
{
    UIViewController * viewController = [self performTarget:kCTMediatorTargetA action:kCTMediatorActionNativeFetchDetailViewController params:@{@"key":@"value"}];
    if ([viewController isKindOfClass:[UIViewController class]]){
        //view controller 交付出去之后，可以有外界选择是push还是present
        return viewController;
    }else{
        //这是处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (void)CTMediator_presentImage:(UIImage *)image
{
    if (image) {
        [self performTarget:kCTMediatorTargetA action:kCTMediatorActionNativePresentImage params:@{@"image":image}];
    }else{
        [self performTarget:kCTMediatorTargetA action:kCTMediatorActionNativeNoImage params:@{@"image":[UIImage imageNamed:@"noImage"]}];
    }
}

- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void (^)(NSDictionary *))cancelAction confirmAction:(void (^)(NSDictionary *))confirmAction
{
    NSMutableDictionary * paramsToSend = [[NSMutableDictionary alloc] init];
    if (message) {
        paramsToSend[@"message"] = message;
    }
    if (cancelAction) {
        paramsToSend[@"CancelAction"] = cancelAction;
    }
    if (confirmAction) {
        paramsToSend[@"confirmAction"] = confirmAction;
    }
    [self performTarget:kCTMediatorTargetA action:kCTMediatorActionNativeShowAlert params:paramsToSend];
}

@end
