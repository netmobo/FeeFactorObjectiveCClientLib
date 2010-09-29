//
//  UserBankAccount.m
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserBankAccount.h"


@implementation UserBankAccount

@synthesize accountNumber;
@synthesize bankAccountID;
@synthesize bankCode;
@synthesize branchCode;
@synthesize brandID;
@synthesize checkDigit;
@synthesize dob;
@synthesize IBanCheckDigits;
@synthesize isoCountryCode;
@synthesize pin;
@synthesize socialSecurityNumber;
@synthesize taxID;
@synthesize userID;
@synthesize verified;

- (void)dealloc
{
	[accountNumber release];
	accountNumber = nil;
	[bankAccountID release];
	bankAccountID = nil;
	[bankCode release];
	bankCode = nil;
	[branchCode release];
	branchCode = nil;
	[brandID release];
	brandID = nil;
	[checkDigit release];
	checkDigit = nil;
	[dob release];
	dob = nil;
	[IBanCheckDigits release];
	IBanCheckDigits = nil;
	[isoCountryCode release];
	isoCountryCode = nil;
	[pin release];
	pin = nil;
	[socialSecurityNumber release];
	socialSecurityNumber = nil;
	[taxID release];
	taxID = nil;
	[userID release];
	userID = nil;

	[super dealloc];
}

@end
