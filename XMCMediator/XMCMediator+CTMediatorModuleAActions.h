//
//  XMCMediator+CTMediatorModuleAActions.h
//  XMCMediator
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 xmc. All rights reserved.
//

#import "XMCMediator.h"
#import <UIKit/UIKit.h>

@interface XMCMediator (CTMediatorModuleAActions)

- (UIViewController *) CTMediator_viewControllerForDetail;
- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary * info))cancelAction confirmAction:(void(^)(NSDictionary * info))confirmAction;
- (void)CTMediator_presentImage:(UIImage *)image;

@end
