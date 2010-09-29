//
//  CardTransactionHistorySearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CardTransactionHistorySearchResult.h"


@implementation CardTransactionHistorySearchResult

@synthesize searchResult;

- (void)dealloc
{
	[searchResult release];
	searchResult = nil;

	[super dealloc];
}

@end
