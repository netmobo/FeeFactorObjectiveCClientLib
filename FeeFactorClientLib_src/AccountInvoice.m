//
//  AccountInvoice.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountInvoice.h"


@implementation AccountInvoice

@synthesize accountID;
@synthesize amountDue;
@synthesize archived;
@synthesize brandID;
@synthesize currentCharges;
@synthesize dateFrom;
@synthesize dateTo;
@synthesize dueDate;
@synthesize fullyPaid;
@synthesize fullyPaidDate;
@synthesize gmt;
@synthesize invoiceCode;
@synthesize invoiceDate;
@synthesize invoiceNumber;
@synthesize preparedBy;
@synthesize remarks;
@synthesize sentToCustomer;
@synthesize userID;

- (void)dealloc
{
	[accountID release];
	accountID = nil;
	[amountDue release];
	amountDue = nil;
	[brandID release];
	brandID = nil;
	[currentCharges release];
	currentCharges = nil;
	[dateFrom release];
	dateFrom = nil;
	[dateTo release];
	dateTo = nil;
	[dueDate release];
	dueDate = nil;
	[fullyPaid release];
	fullyPaid = nil;
	[fullyPaidDate release];
	fullyPaidDate = nil;
	[gmt release];
	gmt = nil;
	[invoiceCode release];
	invoiceCode = nil;
	[invoiceDate release];
	invoiceDate = nil;
	[invoiceNumber release];
	invoiceNumber = nil;
	[preparedBy release];
	preparedBy = nil;
	[remarks release];
	remarks = nil;
	[userID release];
	userID = nil;

	[super dealloc];
}

@end
