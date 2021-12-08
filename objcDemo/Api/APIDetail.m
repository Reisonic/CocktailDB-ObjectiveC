//
//  APIDetail.m
//  objcDemo
//
//  Created by Владислав Космачев.
//

#import <Foundation/Foundation.h>
#import "APIDetail.h"

@implementation APIDetail

- (NSArray<NSString *> *) getDataProduct:(NSString *)url{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    NSLog(@"%@, status code %li", url, (long)[responseCode statusCode]);
       
    
    NSString *str = [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
    
    NSError *error2;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:oResponseData options:kNilOptions error:&error2];
    NSMutableArray<NSString *> *array = [[NSMutableArray alloc] init];
    NSMutableDictionary *response = [[[json valueForKey:@"drinks"] objectAtIndex:0]mutableCopy];
    [array addObject:[response valueForKey:@"strDrinkThumb"]];
    [array addObject:[response valueForKey:@"strDrink"]];
    [array addObject:[response valueForKey:@"strInstructions"]];
    return array;
}

@end
