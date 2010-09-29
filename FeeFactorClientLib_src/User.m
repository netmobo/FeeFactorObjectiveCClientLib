//
//  User.m
//  FeeFactor
//
//  Created by Netmobo on 15/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "User.h"


@implementation User

@synthesize changePassword;
@synthesize expiration;
@synthesize lastAddress;
@synthesize lastLogIn;
@synthesize password;
@synthesize preferences;
@synthesize profileID;
@synthesize settings;
@synthesize userID;
@synthesize username;
@synthesize billingSchedule;
@synthesize brandID;
@synthesize billingEmailAddress;

- (void)dealloc
{
	[billingEmailAddress release];
	billingEmailAddress = nil;
	[billingSchedule release];
	billingSchedule = nil;
	[brandID release];
	brandID = nil;
	[expiration release];
	expiration = nil;
	[lastAddress release];
	lastAddress = nil;
	[lastLogIn release];
	lastLogIn = nil;
	[password release];
	password = nil;
	[preferences release];
	preferences = nil;
	[settings release];
	settings = nil;
	[username release];
	username = nil;
	
	[userID release];
	
	[profileID release];

	[super dealloc];
}


@end
