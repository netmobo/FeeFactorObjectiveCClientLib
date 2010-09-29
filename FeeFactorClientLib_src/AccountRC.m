//
//  AccountRC.m
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountRC.h"


@implementation AccountRC

@synthesize accountID;
@synthesize accountRCID;
@synthesize amount;
@synthesize brandID;
@synthesize createdBy;
@synthesize creationDate;
@synthesize cronExpression;
@synthesize description;
@synthesize effectivityDate;
@synthesize endDate;
@synthesize nextAppTime;
@synthesize prevAppTime;
@synthesize priority;
@synthesize serialNumber;
@synthesize status;



- (void)dealloc
{
	[accountID release];
	[createdBy release];
	[creationDate release];
	
	[cronExpression release];
	[description release];
	[effectivityDate release];
	
	[endDate release];
	[nextAppTime release];
	[prevAppTime release];
	[status release];
	
	[super dealloc];
	
}


@end
