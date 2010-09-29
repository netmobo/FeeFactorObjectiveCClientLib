//
//  BrandService.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrandService : NSObject {
	NSNumber * brandID;
	NSString *  configInfo;
	NSNumber * currencyID;
    NSString *  description;
    NSString *  description2;
	NSNumber * groupServiceID;
	NSNumber * maxTransactionQuantity;
    NSString *  preference;
	NSNumber * serviceID;
    NSString *  serviceName;
}

@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, copy) NSString *configInfo;
@property (nonatomic, retain) NSNumber *currencyID;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *description2;
@property (nonatomic, retain) NSNumber *groupServiceID;
@property (nonatomic, retain) NSNumber *maxTransactionQuantity;
@property (nonatomic, copy) NSString *preference;
@property (nonatomic, retain) NSNumber *serviceID;
@property (nonatomic, copy) NSString *serviceName;

@end
