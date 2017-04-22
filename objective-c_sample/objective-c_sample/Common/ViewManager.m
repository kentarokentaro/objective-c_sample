//
//  ViewManager.m
//  objective-c_sample
//
//  Created by Careritz on 2017/03/09.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import "ViewManager.h"

@implementation ViewManager
- (NSArray *)viewArray {
  NSArray *viewArray = @[
    @{ @"Classname" : @"HelloViewController",
       @"ItemName" : @"Hello World" }
  ];
  return viewArray;
}

- (NSString *)itemName:(NSInteger)indexPath {
  NSDictionary *dictionary = [self viewArray][indexPath];
  NSString *itemName = [dictionary objectForKey:@"ItemName"];
  return itemName;
}

- (UIViewController *)viewControllerName:(NSInteger)indexPath {
  NSDictionary *dictionary = [self viewArray][indexPath];
  Class myClass = NSClassFromString([dictionary objectForKey:@"Classname"]);
  UIViewController *vc = (UIViewController *)[[myClass alloc] init];
  return vc;
}

@end
