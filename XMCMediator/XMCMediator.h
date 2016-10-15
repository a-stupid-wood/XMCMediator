//
//  XMCMediator.h
//  XMCMediator
//
//  Created by mac on 16/10/13.
//  Copyright © 2016年 xmc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMCMediator : NSObject

+ (instancetype)sharedInstance;

//远程App调用入口
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary * info))completion;
//本地App调用入口
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;

@end
