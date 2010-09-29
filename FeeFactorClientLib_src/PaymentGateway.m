//
//  PaymentGateway.m
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PaymentGateway.h"


@implementation PaymentGateway

@synthesize authentication;
@synthesize brandID;
@synthesize currency;
@synthesize groupID;
@synthesize password;
@synthesize paymentGatewayID;
@synthesize type;
@synthesize username;

- (void)dealloc
{
	[authentication release];
	authentication = nil;
	[brandID release];
	brandID = nil;
	[currency release];
	currency = nil;
	[groupID release];
	groupID = nil;
	[password release];
	password = nil;
	[paymentGatewayID release];
	paymentGatewayID = nil;
	[type release];
	type = nil;
	[username release];
	username = nil;

	[super dealloc];
}

@end
