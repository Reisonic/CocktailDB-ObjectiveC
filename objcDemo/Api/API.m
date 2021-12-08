//
//  API.m
//  objcDemo
//
//  Created by Владислав Космачев.
//

#import <Foundation/Foundation.h>
#import "API.h"
#import <UIKit/UIKit.h>
#import "DataModel.h"

@implementation API

- (NSArray<DataModel *> *) getDataSearch:(NSString *)url{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    NSLog(@"%@, status code %li", url, (long)[responseCode statusCode]);
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:oResponseData options:kNilOptions error:&error];
    
    int c = 0;
    NSMutableArray<DataModel *> *array = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *dict = [json valueForKey:@"drinks"];
    if (dict.count != 0){
        while (c != dict.count) {
            DataModel *dataModel = [DataModel alloc];
            [dataModel initDataModel:[[[[json valueForKey:@"drinks"] valueForKey:@"idDrink"]objectAtIndex:c]mutableCopy] :[[[[json valueForKey:@"drinks"] valueForKey:@"strDrink"]objectAtIndex:c]mutableCopy]];
            [array addObject:dataModel];
            c++;
        }
    }
    return array;
}

@end
