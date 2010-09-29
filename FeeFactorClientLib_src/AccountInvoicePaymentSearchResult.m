//
//  AccountInvoicePaymentSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountInvoicePaymentSearchResult.h"


@implementation AccountInvoicePaymentSearchResult

@synthesize accountInvoicePayment;

- (void)dealloc
{
	[accountInvoicePayment release];
	accountInvoicePayment = nil;

	[super dealloc];
}

@end
