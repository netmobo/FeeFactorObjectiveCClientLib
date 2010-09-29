//
//  BrandProductBaserateSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandProductBaserateSearchResult.h"


@implementation BrandProductBaserateSearchResult

@synthesize brandProductBaserates;

- (void)dealloc
{
	[brandProductBaserates release];
	brandProductBaserates = nil;

	[super dealloc];
}

@end
