//
//  BrandService.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandService.h"


@implementation BrandService

@synthesize brandID;
@synthesize configInfo;
@synthesize currencyID;
@synthesize description;
@synthesize description2;
@synthesize groupServiceID;
@synthesize maxTransactionQuantity;
@synthesize preference;
@synthesize serviceID;
@synthesize serviceName;

- (void)dealloc
{
	[brandID release];
	brandID = nil;
	[configInfo release];
	configInfo = nil;
	[currencyID release];
	currencyID = nil;
	[description release];
	description = nil;
	[description2 release];
	description2 = nil;
	[groupServiceID release];
	groupServiceID = nil;
	[maxTransactionQuantity release];
	maxTransactionQuantity = nil;
	[preference release];
	preference = nil;
	[serviceID release];
	serviceID = nil;
	[serviceName release];
	serviceName = nil;

	[super dealloc];
}

@end
