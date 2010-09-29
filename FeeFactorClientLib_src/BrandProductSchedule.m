//
//  BrandProductSchedule.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandProductSchedule.h"


@implementation BrandProductSchedule

@synthesize dateFrom;
@synthesize dateTo;
@synthesize days;
@synthesize productID;
@synthesize scheduleID;
@synthesize timeFrom;
@synthesize timeTo;

- (void)dealloc
{
	[dateFrom release];
	dateFrom = nil;
	[dateTo release];
	dateTo = nil;
	[days release];
	days = nil;
	[productID release];
	productID = nil;
	[scheduleID release];
	scheduleID = nil;
	[timeFrom release];
	timeFrom = nil;
	[timeTo release];
	timeTo = nil;

	[super dealloc];
}

@end
