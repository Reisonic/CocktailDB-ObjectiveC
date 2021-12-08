//
//  DetailViewController.m
//  objcDemo
//
//  Created by Владислав Космачев.
//

#import "DetailViewController.h"
#import "APIDetail.h"
#import "Constants.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    APIDetail *api = [[APIDetail alloc]init];
    NSString *str = [[NSString alloc] initWithFormat:@"%@%@",apiDetail,self.idProduct];
    _responseDetail = [api getDataProduct:str];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: _responseDetail[0]]];
    self.imageView.image = [UIImage imageWithData: imageData];
    self.titleLabel.text = _responseDetail[1];
    self.instructionLabel.text = _responseDetail[2];
}

@end
