//
//  AccountRCActivityLog.m
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountRCActivityLog.h"


@implementation AccountRCActivityLog





@synthesize accountID;
@synthesize accountRCActivityLogID;
@synthesize accountRCID;
@synthesize activity;
@synthesize adminID;
@synthesize adminName;
@synthesize amount;
@synthesize brandID;
@synthesize ip;
@synthesize recAccountRCALID;
@synthesize remarks;
@synthesize schedule;
@synthesize serialNumber;
@synthesize timestamp;
@synthesize type;


- (void)dealloc
{
	
	[accountID release];
	[activity release];
	[adminName release];
	
	[ip release];
	[remarks release];
	[schedule release];
	
	[timestamp release];
	[type release];

	[super dealloc];
}

@end
