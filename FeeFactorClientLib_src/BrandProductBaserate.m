//
//  BrandProductBaserate.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandProductBaserate.h"


@implementation BrandProductBaserate

@synthesize incrementQuantity;
@synthesize indexNumber;
@synthesize planRate;
@synthesize productID;
@synthesize quantity;
@synthesize rate;
@synthesize rateID;
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
	[rate release];
	rate = nil;
	[rateID release];
	rateID = nil;
	[scheduleID release];
	scheduleID = nil;

	[super dealloc];
}

@end
