//
//  BillingRecord.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BillingRecord.h"


@implementation BillingRecord

@synthesize accountID;
@synthesize accountOwnerID;
@synthesize amount;
@synthesize archived;
@synthesize billingRecordID;
@synthesize brType;
@synthesize brandID;
@synthesize dateFrom;
@synthesize dateTo;
@synthesize description;
@synthesize groupID;
@synthesize invoiceNumber;
@synthesize productID;
@synthesize quantity;
@synthesize remarks;
@synthesize transactionCount;
@synthesize unit;
@synthesize unitPrice;
@synthesize userID;

- (void)dealloc
{
	[accountID release];
	accountID = nil;
	[accountOwnerID release];
	accountOwnerID = nil;
	[amount release];
	amount = nil;
	[billingRecordID release];
	billingRecordID = nil;
	[brType release];
	brType = nil;
	[brandID release];
	brandID = nil;
	[dateFrom release];
	dateFrom = nil;
	[dateTo release];
	dateTo = nil;
	[description release];
	description = nil;
	[groupID release];
	groupID = nil;
	[invoiceNumber release];
	invoiceNumber = nil;
	[productID release];
	productID = nil;
	[quantity release];
	quantity = nil;
	[remarks release];
	remarks = nil;
	[transactionCount release];
	transactionCount = nil;
	[unit release];
	unit = nil;
	[unitPrice release];
	unitPrice = nil;
	[userID release];
	userID = nil;

	[super dealloc];
}

@end
