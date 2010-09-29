//
//  Util.h
//  FeeFactor
//
//  Created by Netmobo on 30/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Util : NSObject {

}


+(NSMutableDictionary *)propertyDictionary:(NSObject *) objt;

+ (NSMutableDictionary *)propertyWithValueDictionary:(NSObject *) objt;

+ (NSString *)urlEncodeValue:(NSString *)unencodedString;

@end
