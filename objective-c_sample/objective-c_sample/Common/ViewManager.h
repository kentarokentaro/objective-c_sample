//
//  ViewManager.h
//  objective-c_sample
//
//  Created by Careritz on 2017/03/09.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewManager : NSObject
- (NSArray*)viewArray;
- (NSString*)itemName:(NSInteger)indexPath;
- (UIViewController*)selectViewController:(NSInteger)indexPath;
- (UIViewController*)selectViewControllerForStoryBoard:(NSInteger)indexPath;
@end
