//
//  UserCardSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserCardSearchResult.h"


@implementation UserCardSearchResult

@synthesize results;

- (void)dealloc
{
	[results release];
	results = nil;

	[super dealloc];
}

@end
