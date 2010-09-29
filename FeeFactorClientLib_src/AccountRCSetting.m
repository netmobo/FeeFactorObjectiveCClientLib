//
//  AccountRCSetting.m
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AccountRCSetting.h"


@implementation AccountRCSetting

@synthesize accountRCID;
@synthesize key;
@synthesize value;


- (void)dealloc
{
	[key release];
	[value release];
	
	[super dealloc];
}

@end
