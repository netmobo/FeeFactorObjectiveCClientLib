//
//  UserQuestion.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserQuestion.h"


@implementation UserQuestion

@synthesize answer;
@synthesize question;
@synthesize questionID;
@synthesize requireExactMatch;
@synthesize userID;

- (void)dealloc
{
	[answer release];
	answer = nil;
	[question release];
	question = nil;

	[super dealloc];
}

@end
