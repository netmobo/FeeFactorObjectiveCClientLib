//
//  AccountInvoiceSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountInvoiceSearchResult.h"


@implementation AccountInvoiceSearchResult

@synthesize accountInvoice;

- (void)dealloc
{
	[accountInvoice release];
	accountInvoice = nil;

	[super dealloc];
}

@end
