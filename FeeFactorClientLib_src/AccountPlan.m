//
//  AccountPlan.m
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountPlan.h"


@implementation AccountPlan



@synthesize accountPlanID;
@synthesize amount;
@synthesize description;
@synthesize effectivityDate;
@synthesize endDate;
@synthesize planID;
@synthesize serialNumber;


- (void)dealloc
{
	[description release];
	[effectivityDate release];
	[endDate release];
	
	[super dealloc];
}

@end
