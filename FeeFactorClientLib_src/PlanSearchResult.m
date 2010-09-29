//
//  PlanSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PlanSearchResult.h"


@implementation PlanSearchResult

@synthesize plans;

- (void)dealloc
{
	[plans release];
	plans = nil;

	[super dealloc];
}

@end
