//
//  Model.m
//  MVC
//
//  Created by Netmobo on 2/19/09.
//  Copyright 2010 Netmobo. All rights reserved.
//
/*
 Copyright (c) 2010, NETMOBO LLC
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of NETMOBO LLC nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "NetmoboFeefactorModel.h"

@implementation NetmoboFeefactorModel

@synthesize schema;
@synthesize host;
@synthesize port;
@synthesize serviceUrl;
@synthesize userName;
@synthesize passWord;
@synthesize encode;
@synthesize realm;
@synthesize errorCode;
@synthesize resultMsg;

- (id) init {
	self = [super init];
	if (self != nil) {
		schema = @"";
		host = @"";
		port = @"";
		serviceUrl = @"";
		userName = @"";
		passWord = @"";
		encode = @"";
		realm = @"";
		errorCode = @"";
		resultMsg = @"";
	}
	return self;
}


- (void) dealloc {
	// feefactor
	[schema release];
	[host release];
	[port release];
	[serviceUrl release];
	[userName release];
	[passWord release];
	[encode release];
	[realm release];
	[errorCode release];
	[resultMsg release];
	
	[super dealloc];
}

static NetmoboFeefactorModel *sharedMyModel = nil; 

+ (id) sharedModel { 
	@synchronized(self) { 
		if (sharedMyModel == nil) { 
			[[self alloc] init]; 
		} 
	} 
	
	return sharedMyModel; 
} 

+ (id) allocWithZone:(NSZone *)zone { 
	@synchronized(self) { 
		if (sharedMyModel == nil) { 
			sharedMyModel = [super allocWithZone:zone]; 
			return sharedMyModel; 
		} 
	} 
	
	return nil; 
} 

- (id) copyWithZone:(NSZone *)zone { 
	return self; 
} 

- (id) retain { 
	return self; 
} 

- (unsigned) retainCount { 
	return UINT_MAX; 
} 

- (void) release { 
} 

- (id) autorelease { 
	return self; 
}

@end
