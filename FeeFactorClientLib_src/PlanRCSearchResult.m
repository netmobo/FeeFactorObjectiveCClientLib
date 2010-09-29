//
//  PlanRCSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PlanRCSearchResult.h"


@implementation PlanRCSearchResult

@synthesize planRC;

- (void)dealloc
{
	[planRC release];
	planRC = nil;

	[super dealloc];
}

@end
