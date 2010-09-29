//
//  AccountDevice.m
//  FeeFactor
//
//  Created by Netmobo on 1/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountDevice.h"


@implementation AccountDevice

@synthesize accountid;
@synthesize brandserviceid;
@synthesize deviceID;

- (void)dealloc
{
	[accountid release];
	[brandserviceid release];
	[deviceID release];
	
	[super dealloc];
}

@end
