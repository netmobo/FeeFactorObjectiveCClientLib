//
//  Config.m
//  FeeFactor
//
//  Created by Netmobo on 15/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Config.h"

static Config *defaultConfig = nil;

@implementation Config

@synthesize schema, host, port, serviceUrl, userName, passWord, encode, realm;
@synthesize errorCode;


+ (id) defaultConfig{
	
	@synchronized(self) {
		if(defaultConfig == nil)
			defaultConfig =	[[self alloc] init];
	}
	return defaultConfig;
}


-(void)dealloc
{
	[errorCode release];
	[schema release];
	[host release];
	[port release];
	[serviceUrl release];
	[userName release];
	[passWord release];
	[encode release];
	[realm release];
	
	[super dealloc];
}

@end
