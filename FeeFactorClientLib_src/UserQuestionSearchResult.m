//
//  UserQuestionSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserQuestionSearchResult.h"


@implementation UserQuestionSearchResult

@synthesize userQuestions;

- (void)dealloc
{
	[userQuestions release];
	userQuestions = nil;

	[super dealloc];
}

@end
