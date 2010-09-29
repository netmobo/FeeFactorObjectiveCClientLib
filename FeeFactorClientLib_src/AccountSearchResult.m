//
//  AccountSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountSearchResult.h"


@implementation AccountSearchResult

@synthesize accountResults;

- (void)dealloc
{
	[accountResults release];
	accountResults = nil;

	[super dealloc];
}

@end
