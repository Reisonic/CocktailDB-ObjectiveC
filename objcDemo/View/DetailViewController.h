//
//  DetailViewController.h
//  objcDemo
//
//  Created by Владислав Космачев.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property(nonatomic) NSString *idProduct;
@property(nonatomic) NSMutableArray *responseDetail;
@end

NS_ASSUME_NONNULL_END
