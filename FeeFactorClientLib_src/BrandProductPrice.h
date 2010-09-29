//
//  BrandProductPrice.h
//  FeeFactor
//
//  Created by Netmobo on 16/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrandProductPrice : NSObject {

	@protected
	NSNumber *incrementQuantity;
	NSNumber *indexNumber;
	NSNumber *productID;
	NSNumber *quantity;
	NSNumber *price;
	NSNumber *priceID;
	NSNumber *scheduleID;
}

@property (nonatomic, retain) NSNumber *incrementQuantity;
@property (nonatomic, retain) NSNumber *indexNumber;
@property (nonatomic, retain) NSNumber *productID;
@property (nonatomic, retain) NSNumber *quantity;
@property (nonatomic, retain) NSNumber *price;
@property (nonatomic, retain) NSNumber *priceID;
@property (nonatomic, retain) NSNumber *scheduleID;

@end
