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

- (NSString *)className:(NSInteger)indexPath {
  NSDictionary *dictionary = [self viewArray][indexPath];
  NSString *classname = [dictionary objectForKey:@"Classname"];
  return classname;
}

- (UIViewController *)selectViewController:(NSInteger)indexPath {
  Class myClass = NSClassFromString([self className:indexPath]);
  UIViewController *vc = (UIViewController *)[[myClass alloc] init];
  return vc;
}

- (UIViewController *)selectViewControllerForStoryBoard:(NSInteger)indexPath {
  UIStoryboard *storyboard =
      [UIStoryboard storyboardWithName:[self className:indexPath] bundle:nil];
  UIViewController *vc = [storyboard
      instantiateViewControllerWithIdentifier:[self className:indexPath]];
  return vc;
}

@end
