//
//  BrandProductBaserate.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrandProductBaserate : NSObject {
	 NSNumber * incrementQuantity;
     NSNumber * indexNumber;
     Boolean planRate;
     NSNumber * productID;
     NSNumber * quantity;
     NSNumber * rate;
     NSNumber * rateID;
     NSNumber * scheduleID;
}

@property (nonatomic, retain) NSNumber *incrementQuantity;
@property (nonatomic, retain) NSNumber *indexNumber;
@property (nonatomic, assign) Boolean planRate;
@property (nonatomic, retain) NSNumber *productID;
@property (nonatomic, retain) NSNumber *quantity;
@property (nonatomic, retain) NSNumber *rate;
@property (nonatomic, retain) NSNumber *rateID;
@property (nonatomic, retain) NSNumber *scheduleID;

@end
