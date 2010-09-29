//
//  BrandProduct.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrandProduct : NSObject {
	NSNumber * billingBlock;
    NSString * description;
    NSNumber * groupProductID;
    Boolean isPlan;
    NSNumber * minimumChargeable;
    NSString * productCode;
    NSNumber * productID;
    NSNumber * serviceID;
    NSString * settings;
	Boolean useGroupServiceBaserate;
}

@property (nonatomic, retain) NSNumber *billingBlock;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, retain) NSNumber *groupProductID;
@property (nonatomic, assign) Boolean isPlan;
@property (nonatomic, retain) NSNumber *minimumChargeable;
@property (nonatomic, copy) NSString *productCode;
@property (nonatomic, retain) NSNumber *productID;
@property (nonatomic, retain) NSNumber *serviceID;
@property (nonatomic, copy) NSString *settings;
@property (nonatomic, assign) Boolean useGroupServiceBaserate;

@end
