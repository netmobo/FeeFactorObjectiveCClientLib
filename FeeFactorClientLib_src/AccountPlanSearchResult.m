//
//  AccountPlanSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountPlanSearchResult.h"


@implementation AccountPlanSearchResult

@synthesize accountPlanResults;

- (void)dealloc
{
	[accountPlanResults release];
	accountPlanResults = nil;

	[super dealloc];
}

@end
