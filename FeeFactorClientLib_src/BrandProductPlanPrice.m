//
//  BrandProductPlanPrice.m
//  FeeFactor
//
//  Created by Netmobo on 16/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandProductPlanPrice.h"


@implementation BrandProductPlanPrice

@synthesize incrementQuantity;
@synthesize indexNumber;
@synthesize productID;
@synthesize quantity;
@synthesize price;
@synthesize priceID;
@synthesize scheduleID;

- (void)dealloc
{
	[incrementQuantity release];
	incrementQuantity = nil;
	[indexNumber release];
	indexNumber = nil;
	[productID release];
	productID = nil;
	[quantity release];
	quantity = nil;
	[price release];
	price = nil;
	[priceID release];
	priceID = nil;
	[scheduleID release];
	scheduleID = nil;

	[super dealloc];
}

@end
