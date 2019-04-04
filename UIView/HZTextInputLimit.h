//
//  HZTextInputLimit.h
//  Louzhangmen
//
//  Created by Quanhai on 2018/6/29.
//  Copyright © 2018年 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>
#import <objc/runtime.h>


#define PROPERTY_NAME @"limit"

#define DECLARE_PROPERTY(className) \
@interface className (Limit) @end

DECLARE_PROPERTY(UITextField)
DECLARE_PROPERTY(UITextView)

@interface HZTextInputLimit : NSObject

@property(nonatomic, assign) BOOL enableLimitCount;

+ (HZTextInputLimit *) sharedInstance;


// usage
// [textFieldObj setValue:@value forKey:@"limit"]
// [textViewObj setValue:@value forKey:@"limit"]


@end
