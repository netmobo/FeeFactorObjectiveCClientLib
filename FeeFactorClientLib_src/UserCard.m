//
//  UserCard.m
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserCard.h"


@implementation UserCard

@synthesize address1;
@synthesize address2;
@synthesize brandID;
@synthesize cardID;
@synthesize cardNumber;
@synthesize city;
@synthesize country;
@synthesize currency;
@synthesize emailAddress;
@synthesize expiryMonth;
@synthesize expiryYear;
@synthesize firstName;
@synthesize issuer;
@synthesize lastName;
@synthesize middleInitial;
@synthesize phoneNumber;
@synthesize remarks;
@synthesize state;
@synthesize userID;
@synthesize zipcode;

- (void)dealloc
{
	[address1 release];
	address1 = nil;
	[address2 release];
	address2 = nil;
	[brandID release];
	brandID = nil;
	[cardID release];
	cardID = nil;
	[cardNumber release];
	cardNumber = nil;
	[city release];
	city = nil;
	[country release];
	country = nil;
	[currency release];
	currency = nil;
	[emailAddress release];
	emailAddress = nil;
	[expiryMonth release];
	expiryMonth = nil;
	[expiryYear release];
	expiryYear = nil;
	[firstName release];
	firstName = nil;
	[issuer release];
	issuer = nil;
	[lastName release];
	lastName = nil;
	[middleInitial release];
	middleInitial = nil;
	[phoneNumber release];
	phoneNumber = nil;
	[remarks release];
	remarks = nil;
	[state release];
	state = nil;
	[userID release];
	userID = nil;
	[zipcode release];
	zipcode = nil;

	[super dealloc];
}

@end
