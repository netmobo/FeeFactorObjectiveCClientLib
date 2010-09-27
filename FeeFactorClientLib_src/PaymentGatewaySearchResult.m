//
//  PaymentGatewaySearchResult.m
//  FeefactorVip2
//
//  Created by Vicente Malixi on 9/15/10.
//  Copyright 2010 Aurisoft. All rights reserved.
//

#import "PaymentGatewaySearchResult.h"


@implementation PaymentGatewaySearchResult

@synthesize paymentGatewayInfoSearchResult;

- (void)dealloc
{
	[paymentGatewayInfoSearchResult release];
	paymentGatewayInfoSearchResult = nil;
	
	[super dealloc];
}

@end
