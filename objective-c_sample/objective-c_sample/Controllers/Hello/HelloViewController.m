//
//  HelloViewController.m
//  objective-c_sample
//
//  Created by Miura Kentaro on 2017/04/22.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import "HelloViewController.h"

@interface HelloViewController () {
  int count;
  NSTimer *mainTimer;
  NSString *text;
}

@property(weak, nonatomic) IBOutlet UILabel *helloLabel;
@end

@implementation HelloViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  count = 0;
  text =
      @"Hello World!\nやっぱりHello "
      @"Wolrdを書かないとはじまらない\nそう・・・\nそれは世界とつながる瞬間で"
      @"す";

  NSTimer *timer =
      [NSTimer scheduledTimerWithTimeInterval:0.1
                                       target:self
                                     selector:@selector(dispAnimation:)
                                     userInfo:nil
                                      repeats:YES];
  mainTimer = timer;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)dispAnimation:(NSTimer *)timer {
  [UIView
      animateWithDuration:0.2
               animations:^{
                 count++;
                 NSString *tmp_str = [text substringToIndex:(count)];

                 // AttributeStringに変換
                 NSMutableAttributedString *attrStr;
                 attrStr =
                     [[NSMutableAttributedString alloc] initWithString:tmp_str];
                 [attrStr attributedSubstringFromRange:NSMakeRange(0, 1)];

                 // フォント
                 [attrStr
                     addAttribute:NSFontAttributeName
                            value:[UIFont fontWithName:@"Futura-CondensedMedium"
                                                  size:17.]
                            range:NSMakeRange(0, [attrStr length])];
                 [_helloLabel setAttributedText:attrStr];
               }];

  if (text.length == count) {
    [timer invalidate];
    count = 0;
    timer = nil;
  }
}

@end
