//
//  Plan.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Plan.h"


@implementation Plan

@synthesize brandID;
@synthesize currencyID;
@synthesize description;
@synthesize freeValue;
@synthesize planCharge;
@synthesize planID;
@synthesize planType;
@synthesize rollOverMode;
@synthesize rollOverValue;
@synthesize settings;

- (void)dealloc
{
	[brandID release];
	brandID = nil;
	[currencyID release];
	currencyID = nil;
	[description release];
	description = nil;
	[freeValue release];
	freeValue = nil;
	[planCharge release];
	planCharge = nil;
	[planID release];
	planID = nil;
	[planType release];
	planType = nil;
	[rollOverMode release];
	rollOverMode = nil;
	[rollOverValue release];
	rollOverValue = nil;
	[settings release];
	settings = nil;

	[super dealloc];
}

@end
