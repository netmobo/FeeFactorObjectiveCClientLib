//
//  AccountDeviceSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 1/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountDeviceSearchResult.h"


@implementation AccountDeviceSearchResult

@synthesize accountDeviceResults;

- (void)dealloc
{
	[accountDeviceResults release];
	accountDeviceResults = nil;
	
	[super dealloc];
}

@end
