//
//  UserPaymentAuthorization.m
//  FeeFactor
//
//  Created by Netmobo on 16/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserPaymentAuthorization.h"


@implementation UserPaymentAuthorization

@synthesize balanceLimit;
@synthesize brandID;
@synthesize description;
@synthesize expirationDate;
@synthesize limitAmount;
@synthesize paymentAuthorizationID;
@synthesize remarks;
@synthesize schedule;
@synthesize scheduleAmount;
@synthesize status;
@synthesize userID;

- (void)dealloc
{
	[balanceLimit release];
	balanceLimit = nil;
	[brandID release];
	brandID = nil;
	[description release];
	description = nil;
	[expirationDate release];
	expirationDate = nil;
	[limitAmount release];
	limitAmount = nil;
	[paymentAuthorizationID release];
	paymentAuthorizationID = nil;
	[remarks release];
	remarks = nil;
	[schedule release];
	schedule = nil;
	[scheduleAmount release];
	scheduleAmount = nil;
	[status release];
	status = nil;
	[userID release];
	userID = nil;

	[super dealloc];
}

@end
