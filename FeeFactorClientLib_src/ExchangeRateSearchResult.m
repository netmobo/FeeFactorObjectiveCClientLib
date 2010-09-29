//
//  ExchangeRateSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ExchangeRateSearchResult.h"


@implementation ExchangeRateSearchResult

@synthesize exchangeRateResults;

- (void)dealloc
{
	[exchangeRateResults release];
	exchangeRateResults = nil;

	[super dealloc];
}

@end
