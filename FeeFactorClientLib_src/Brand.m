//
//  Brand.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Brand.h"


@implementation Brand

@synthesize active;
@synthesize balance;
@synthesize billingEmailAddress;
@synthesize billingSchedule;
@synthesize brandID;
@synthesize createdBy;
@synthesize creationDate;
@synthesize creditLimit;
@synthesize defaultProfileID;
@synthesize domain;
@synthesize groupID;
@synthesize name;
@synthesize paymentGatewayID;
@synthesize preferences;
@synthesize referringAgentID;
@synthesize settings;
@synthesize subscriptionType;
@synthesize timeZone;
@synthesize webUrl;

- (void)dealloc
{
	[billingEmailAddress release];
	billingEmailAddress = nil;
	[billingSchedule release];
	billingSchedule = nil;
	[creationDate release];
	creationDate = nil;
	[domain release];
	domain = nil;
	[name release];
	name = nil;
	[preferences release];
	preferences = nil;
	[settings release];
	settings = nil;
	[subscriptionType release];
	subscriptionType = nil;
	[timeZone release];
	timeZone = nil;
	[webUrl release];
	webUrl = nil;

	[super dealloc];
}

@end
