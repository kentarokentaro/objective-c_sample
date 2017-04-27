//
//  HelloViewController.m
//  objective-c_sample
//
//  Created by Miura Kentaro on 2017/04/22.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import "HelloViewController.h"

@interface HelloViewController ()
{
    int count;
    NSTimer *mainTimer;
    NSString *text;
}

@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
@end

@implementation HelloViewController

- (void)viewDidLoad {
  [super viewDidLoad];

    count = 0;
    text = @"Hello World!";
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                      target:self
                                                    selector:@selector(dispAnimation:)
                                                    userInfo:nil
                                                     repeats:YES];
    mainTimer = timer;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)dispAnimation:(NSTimer *)timer
{
    _helloLabel.alpha = 0.2f;
    
    [UIView animateWithDuration:0.3 animations:^{
        count++;
        NSString *tmp_str = [text substringToIndex:(count)];
        _helloLabel.alpha = 1.0f;
        _helloLabel.text = tmp_str;
    }];

    if (text.length == count) {
      
        _helloLabel.center = self.view.center;
        CGRect frame = _helloLabel.frame;
        frame.origin.y -= 200; // 右に100移動
        _helloLabel.frame = frame;
        
        [timer invalidate];
        count = 0;
        timer = nil;
    }
}

@end
