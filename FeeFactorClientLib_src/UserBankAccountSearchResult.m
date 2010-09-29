//
//  UserBankAccountSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserBankAccountSearchResult.h"


@implementation UserBankAccountSearchResult

@synthesize AccountSearchResult;

- (void)dealloc
{
	[AccountSearchResult release];
	AccountSearchResult = nil;

	[super dealloc];
}

@end
