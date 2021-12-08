//
//  DataModel.h
//  objcDemo
//
//  Created by Владислав Космачев.
//

#ifndef DataModel_h
#define DataModel_h

@interface DataModel : NSObject
@property(nonatomic) NSString *idProduct;
@property(nonatomic) NSString *name;

-(id) initDataModel:(NSString *) idProduct:(NSString *) name;
@end

#endif /* DataModel_h */
