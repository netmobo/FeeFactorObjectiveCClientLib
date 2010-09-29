//
//  UserPaymentSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserPaymentSearchResult.h"


@implementation UserPaymentSearchResult

@synthesize userPayment;



- (void)dealloc
{

	[userPayment release];
	userPayment = nil;

	[super dealloc];
}

@end
