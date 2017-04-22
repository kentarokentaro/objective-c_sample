//
//  ViewController.m
//  objective-c_sample
//
//  Created by Miura Kentaro on 2017/03/04.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import "ViewController.h"
#import "ViewManager.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic)ViewManager *viewManager;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _viewManager.getView.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = [NSString stringWithFormat:@"%@",_viewManager.getView[indexPath.row]];
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:@"Cell"];
    cell.textLabel.text = cellName;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toDetailViewController" sender:self];
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"toDetailViewController"]) {
        NSIndexPath *indexPath = [_tableView indexPathForSelectedRow];
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.textData = [NSString stringWithFormat:@"%@",_viewManager.getView[indexPath.row]];
    }
}

@end
