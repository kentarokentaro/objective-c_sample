//
//  HelloModel.m
//  objective-c_sample
//
//  Created by Miura Kentaro on 2017/04/22.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import "HelloModel.h"

@implementation HelloModel

+ (NSString *)getOverview {
  NSString *str = HelloString(@"Overview_Hello");
  return str;
}

+ (NSString *)getButtonTitle {
  NSString *str = HelloString(@"ButtonTitle_Hello");
  return str;
}

+ (NSString *)getCodeText {
  NSString *str = HelloString(@"CodeText_Hello");
  return str;
}

+ (NSString *)notes {
  NSString *str = @"";
  return str;
}

@end
