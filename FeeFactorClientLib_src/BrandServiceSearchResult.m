//
//  BrandServiceSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandServiceSearchResult.h"


@implementation BrandServiceSearchResult

@synthesize brandServices;

- (void)dealloc
{
	[brandServices release];
	brandServices = nil;

	[super dealloc];
}

@end
