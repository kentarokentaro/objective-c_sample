//
//  HelloViewController.m
//  objective-c_sample
//
//  Created by Miura Kentaro on 2017/04/22.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import "HelloViewController.h"
#import "HelloModel.h"

@interface HelloViewController () {
  int count;
  NSTimer *mainTimer;
}

@property(weak, nonatomic) IBOutlet UILabel *helloLabel;
@property(weak, nonatomic) IBOutlet UIButton *helloButton;
@property(weak, nonatomic) IBOutlet UITextView *codeTextView;
@property(weak, nonatomic) HelloModel *helloModel;

@end

@implementation HelloViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  count = 0;

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
                 NSString *characterByOne =
                     [[HelloModel getOverview] substringToIndex:(count)];
                 [_helloLabel
                     setAttributedText:[self
                                           createAttributeText:characterByOne]];
               }];

  if ([HelloModel getOverview].length == count) {
    [timer invalidate];
    count = 0;
    timer = nil;

    [UIView animateWithDuration:1.0
                     animations:^{
                       _helloButton.hidden = NO;
                       [_helloButton setTitle:[HelloModel getButtonTitle]
                                     forState:UIControlStateNormal];
                     }];
  }
}

- (NSMutableAttributedString *)createAttributeText:(NSString *)text {
  // AttributeStringに変換
  NSMutableAttributedString *attrStr;
  attrStr = [[NSMutableAttributedString alloc] initWithString:text];
  [attrStr attributedSubstringFromRange:NSMakeRange(0, 1)];

  // フォント
  [attrStr addAttribute:NSFontAttributeName
                  value:[UIFont fontWithName:@"Futura-CondensedMedium" size:17.]
                  range:NSMakeRange(0, [attrStr length])];

  return attrStr;
}

- (IBAction)tapped:(id)sender {
  [UIView animateWithDuration:0.5
                   animations:^{

                     _helloLabel.text = @"Hello World";
                     _helloButton.hidden = YES;

                     _codeTextView.hidden = NO;
                     _codeTextView.text = [HelloModel getCodeText];
                   }];
}

@end
