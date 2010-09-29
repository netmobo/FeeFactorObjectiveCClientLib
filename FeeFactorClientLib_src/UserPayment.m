//
//  UserPayment.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserPayment.h"


@implementation UserPayment

@synthesize amount;
@synthesize amountTaken;
@synthesize brandID;
@synthesize description;
@synthesize paymentDate;
@synthesize paymentID;
@synthesize paymentType;
@synthesize preparedBy;
@synthesize referenceID;
@synthesize remarks;
@synthesize userID;

- (void)dealloc
{
	[amount release];
	amount = nil;
	[amountTaken release];
	amountTaken = nil;
	[brandID release];
	brandID = nil;
	[description release];
	description = nil;
	[paymentDate release];
	paymentDate = nil;
	[paymentID release];
	paymentID = nil;
	[paymentType release];
	paymentType = nil;
	[preparedBy release];
	preparedBy = nil;
	[referenceID release];
	referenceID = nil;
	[remarks release];
	remarks = nil;
	[userID release];
	userID = nil;

	[super dealloc];
}

@end
