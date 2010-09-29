//
//  UserSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserSearchResult.h"


@implementation UserSearchResult

@synthesize userResults;



- (void)dealloc
{


	[userResults release];
	userResults = nil;

	[super dealloc];
}


@end
