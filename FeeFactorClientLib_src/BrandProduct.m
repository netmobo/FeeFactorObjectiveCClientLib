//
//  BrandProduct.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandProduct.h"


@implementation BrandProduct

@synthesize billingBlock;
@synthesize description;
@synthesize groupProductID;
@synthesize isPlan;
@synthesize minimumChargeable;
@synthesize productCode;
@synthesize productID;
@synthesize serviceID;
@synthesize settings;
@synthesize useGroupServiceBaserate;

- (void)dealloc
{
	[billingBlock release];
	billingBlock = nil;
	[description release];
	description = nil;
	[groupProductID release];
	groupProductID = nil;
	[minimumChargeable release];
	minimumChargeable = nil;
	[productCode release];
	productCode = nil;
	[productID release];
	productID = nil;
	[serviceID release];
	serviceID = nil;
	[settings release];
	settings = nil;

	[super dealloc];
}

@end
