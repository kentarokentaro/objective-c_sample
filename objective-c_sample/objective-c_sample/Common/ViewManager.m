//
//  ViewManager.m
//  objective-c_sample
//
//  Created by Careritz on 2017/03/09.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import "ViewManager.h"

@implementation ViewManager
- (NSArray *)getView {
  NSArray *viewArray = [NSArray new];
  viewArray = @[
    @"Variables and Constants", @"Basic Data Class", @"Basic Calculation",
    @"Basic if"
  ];
  return viewArray;
}
@end
