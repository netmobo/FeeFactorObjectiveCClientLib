//
//  Profile.m
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

#import "Profile.h"


@implementation Profile

@synthesize altPhone;
@synthesize city;
@synthesize company;
@synthesize country;
@synthesize dob;
@synthesize email;
@synthesize fax;
@synthesize firstName;
@synthesize imContactInfo;
@synthesize lastName;
@synthesize locale;
@synthesize mi;
@synthesize mobile;
@synthesize others;
@synthesize phone;
@synthesize profileID;
@synthesize state;
@synthesize street;
@synthesize street2;
@synthesize suffix;
@synthesize timeZone;
@synthesize title;
@synthesize web;
@synthesize zip;

- (void)dealloc
{
	[altPhone release];
	altPhone = nil;
	[city release];
	city = nil;
	[company release];
	company = nil;
	[country release];
	country = nil;
	[dob release];
	dob = nil;
	[email release];
	email = nil;
	[fax release];
	fax = nil;
	[firstName release];
	firstName = nil;
	[imContactInfo release];
	imContactInfo = nil;
	[lastName release];
	lastName = nil;
	[locale release];
	locale = nil;
	[mi release];
	mi = nil;
	[mobile release];
	mobile = nil;
	[others release];
	others = nil;
	[phone release];
	phone = nil;
	[state release];
	state = nil;
	[street release];
	street = nil;
	[street2 release];
	street2 = nil;
	[suffix release];
	suffix = nil;
	[timeZone release];
	timeZone = nil;
	[title release];
	title = nil;
	[web release];
	web = nil;
	[zip release];
	zip = nil;

	[super dealloc];
}

@end
