//
//  User.m
//  FeeFactor
//
//  Created by Netmobo on 15/05/10.
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

#import "User.h"


@implementation User

@synthesize changePassword;
@synthesize expiration;
@synthesize lastAddress;
@synthesize lastLogIn;
@synthesize password;
@synthesize preferences;
@synthesize profileID;
@synthesize settings;
@synthesize userID;
@synthesize username;
@synthesize billingSchedule;
@synthesize brandID;
@synthesize billingEmailAddress;

- (void)dealloc
{
	[billingEmailAddress release];
	billingEmailAddress = nil;
	[billingSchedule release];
	billingSchedule = nil;
	[brandID release];
	brandID = nil;
	[expiration release];
	expiration = nil;
	[lastAddress release];
	lastAddress = nil;
	[lastLogIn release];
	lastLogIn = nil;
	[password release];
	password = nil;
	[preferences release];
	preferences = nil;
	[settings release];
	settings = nil;
	[username release];
	username = nil;
	
	[userID release];
	
	[profileID release];

	[super dealloc];
}


@end
