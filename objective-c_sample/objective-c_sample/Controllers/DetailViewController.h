//
//  DetailViewController.h
//  objective-c_sample
//
//  Created by Careritz on 2017/04/04.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface DetailViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) NSString *textData;
@end
