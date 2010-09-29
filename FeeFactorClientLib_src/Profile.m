//
//  Profile.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

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
