//
//  BrandSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandSearchResult.h"


@implementation BrandSearchResult

@synthesize results;

- (void)dealloc
{
	[results release];
	results = nil;

	[super dealloc];
}

@end
