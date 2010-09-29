//
//  AccountHistory.m
//  Netmobo
//
//  Created by Netmobo on 26/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountHistory.h"


@implementation AccountHistory

@synthesize accountHistoryID;
@synthesize adminID;
@synthesize amountChange;
@synthesize description;
@synthesize previousBalance;
@synthesize referenceID;
@synthesize serialNumber;
@synthesize transactionDate;
@synthesize transactionType;

- (void)dealloc
{
	[accountHistoryID release];
	accountHistoryID = nil;
	[adminID release];
	adminID = nil;
	[amountChange release];
	amountChange = nil;
	[description release];
	description = nil;
	[previousBalance release];
	previousBalance = nil;
	[referenceID release];
	referenceID = nil;
	[serialNumber release];
	serialNumber = nil;
	[transactionDate release];
	transactionDate = nil;
	[transactionType release];
	transactionType = nil;

	[super dealloc];
}

@end
