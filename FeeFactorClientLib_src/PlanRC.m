//
//  PlanRC.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PlanRC.h"


@implementation PlanRC

@synthesize amount;
@synthesize description;
@synthesize planID;
@synthesize planRcID;

- (void)dealloc
{
	[amount release];
	amount = nil;
	[description release];
	description = nil;
	[planID release];
	planID = nil;
	[planRcID release];
	planRcID = nil;

	[super dealloc];
}

@end
