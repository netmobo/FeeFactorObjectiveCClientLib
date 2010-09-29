//
//  CurrencySearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CurrencySearchResult.h"


@implementation CurrencySearchResult

@synthesize results;

- (void)dealloc
{
	[results release];
	results = nil;

	[super dealloc];
}

@end
