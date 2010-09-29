//
//  AccountInvoicePayment.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountInvoicePayment.h"


@implementation AccountInvoicePayment

@synthesize invoiceNumber;
@synthesize amount;
@synthesize paymentID;
@synthesize paymentDate;

- (void)dealloc
{
	[invoiceNumber release];
	invoiceNumber = nil;
	[amount release];
	amount = nil;
	[paymentID release];
	paymentID = nil;
	[paymentDate release];
	paymentDate = nil;

	[super dealloc];
}

@end
