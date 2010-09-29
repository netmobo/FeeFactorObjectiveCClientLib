//
//  ExchangeRate.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ExchangeRate.h"


@implementation ExchangeRate

@synthesize currencyID;
@synthesize dateFrom;
@synthesize dateTo;
@synthesize exchangeRateID;
@synthesize rateVsUSD;

- (void)dealloc
{
	[dateFrom release];
	dateFrom = nil;
	[dateTo release];
	dateTo = nil;

	[super dealloc];
}

@end
