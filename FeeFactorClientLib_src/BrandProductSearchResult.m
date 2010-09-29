//
//  BrandProductSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandProductSearchResult.h"


@implementation BrandProductSearchResult

@synthesize brandProducts;

- (void)dealloc
{
	[brandProducts release];
	brandProducts = nil;

	[super dealloc];
}

@end
