//
//  BrandProductPlanPriceSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 16/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandProductPlanPriceSearchResult.h"


@implementation BrandProductPlanPriceSearchResult

@synthesize results;

- (void)dealloc
{
	[results release];
	results = nil;

	[super dealloc];
}

@end
