//
//  Target_A.h
//  XMCMediator
//
//  Created by mac on 16/10/14.
//  Copyright © 2016年 xmc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Target_A : NSObject

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params;
- (id)Action_nativePresentImage:(NSDictionary *)params;
- (id)Action_showAlert:(NSDictionary *)params;

//容错
- (id)Action_nativeNoImage:(NSDictionary *)params;

@end
