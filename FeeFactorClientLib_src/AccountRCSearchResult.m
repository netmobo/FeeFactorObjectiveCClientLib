//
//  AccountRCSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountRCSearchResult.h"


@implementation AccountRCSearchResult

@synthesize accountRCResults;

- (void)dealloc
{
	[accountRCResults release];
	accountRCResults = nil;

	[super dealloc];
}

@end
