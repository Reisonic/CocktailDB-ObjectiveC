//
//  ViewController.h
//  objcDemo
//
//  Created by Владислав Космачев.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "DataModel.h"

@interface ViewController : UIViewController
@property (nonatomic) NSArray<DataModel *> *response;
@property (nonatomic) API *api;
@end

