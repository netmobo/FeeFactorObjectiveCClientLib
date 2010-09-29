//
//  BillingRecordSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BillingRecordSearchResult.h"


@implementation BillingRecordSearchResult

@synthesize billingRecord;

- (void)dealloc
{
	[billingRecord release];
	billingRecord = nil;

	[super dealloc];
}

@end
