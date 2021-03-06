//
//  Brand.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
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

#import "Brand.h"


@implementation Brand

@synthesize active;
@synthesize balance;
@synthesize billingEmailAddress;
@synthesize billingSchedule;
@synthesize brandID;
@synthesize createdBy;
@synthesize creationDate;
@synthesize creditLimit;
@synthesize defaultProfileID;
@synthesize domain;
@synthesize groupID;
@synthesize name;
@synthesize paymentGatewayID;
@synthesize preferences;
@synthesize referringAgentID;
@synthesize settings;
@synthesize subscriptionType;
@synthesize timeZone;
@synthesize webUrl;

- (void)dealloc
{
	[billingEmailAddress release];
	billingEmailAddress = nil;
	[billingSchedule release];
	billingSchedule = nil;
	[creationDate release];
	creationDate = nil;
	[domain release];
	domain = nil;
	[name release];
	name = nil;
	[preferences release];
	preferences = nil;
	[settings release];
	settings = nil;
	[subscriptionType release];
	subscriptionType = nil;
	[timeZone release];
	timeZone = nil;
	[webUrl release];
	webUrl = nil;

	[super dealloc];
}

@end
