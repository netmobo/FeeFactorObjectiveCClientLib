//
//  Currency.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Currency.h"


@implementation Currency

@synthesize brandID;
@synthesize currencyCode;
@synthesize currencyID;
@synthesize description;
@synthesize lastUpdateTime;
@synthesize updateDaily;

- (void)dealloc
{
	[currencyCode release];
	currencyCode = nil;
	[description release];
	description = nil;
	[lastUpdateTime release];
	lastUpdateTime = nil;

	[super dealloc];
}

@end
