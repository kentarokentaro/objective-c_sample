//
//  ViewController.m
//  objective-c_sample
//
//  Created by Miura Kentaro on 2017/03/04.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "ViewManager.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic) ViewManager *viewManager;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // TableView Delegate
  _tableView.delegate = self;
  _tableView.dataSource = self;

  _viewManager = [ViewManager new];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return _viewManager.viewArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *cellName =
      [NSString stringWithFormat:@"%@", [_viewManager itemName:indexPath.row]];
  UITableViewCell *cell =
      [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:@"Cell"];
  cell.textLabel.text = cellName;
  return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.navigationController
      pushViewController:[_viewManager viewControllerName:indexPath.row]
                animated:YES];
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

@end
