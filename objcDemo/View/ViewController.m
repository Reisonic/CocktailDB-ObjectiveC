//
//  ViewController.m
//  objcDemo
//
//  Created by Владислав Космачев.
//

#import "ViewController.h"
#import "API.h"
#import "DetailViewController.h"
#import "DataModel.h"
#import "Constants.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    _api = [[API alloc]init];
    self.searchBar.delegate = self;
    self.tableView.delegate = self;
}

- (void) nextView:(NSString *) idCocktail {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailView = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [detailView setIdProduct:idCocktail];
    [self.navigationController pushViewController:detailView animated:true];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return _response.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = _response[indexPath.row].name;
  
  return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailView = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [detailView setIdProduct:_response[indexPath.row].idProduct];
    [self.navigationController pushViewController:detailView animated:true];
}

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(delayFunction:) object:nil];
    [self performSelector:@selector(delayFunction:) withObject:searchText afterDelay:2];
}

-(void) delayFunction:(NSString *)text{
    NSString *str = [[NSString alloc] initWithFormat:@"%@%@",apiSearch,text];
    _response = [_api getDataSearch:str];
    self.tableView.reloadData;
}

@end
