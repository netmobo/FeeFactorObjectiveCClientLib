//
//  AccountHistorySearchResult.m
//  Netmobo
//
//  Created by Netmobo on 26/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountHistorySearchResult.h"


@implementation AccountHistorySearchResult

@synthesize accountHistoryResults;

- (void)dealloc
{
	[accountHistoryResults release];
	accountHistoryResults = nil;

	[super dealloc];
}

@end
