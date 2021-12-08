//
//  DataModel.m
//  objcDemo
//
//  Created by Владислав Космачев.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"

@implementation DataModel 

-(id) initDataModel:(NSString *)idProduct :(NSString *)name{
    self.idProduct = idProduct;
    self.name = name;
    return self;
}

@end
