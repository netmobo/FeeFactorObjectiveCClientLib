//
//  UserPayment.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
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

#import "UserPayment.h"


@implementation UserPayment

@synthesize amount;
@synthesize amountTaken;
@synthesize brandID;
@synthesize description;
@synthesize paymentDate;
@synthesize paymentID;
@synthesize paymentType;
@synthesize preparedBy;
@synthesize referenceID;
@synthesize remarks;
@synthesize userID;

- (void)dealloc
{
	[amount release];
	amount = nil;
	[amountTaken release];
	amountTaken = nil;
	[brandID release];
	brandID = nil;
	[description release];
	description = nil;
	[paymentDate release];
	paymentDate = nil;
	[paymentID release];
	paymentID = nil;
	[paymentType release];
	paymentType = nil;
	[preparedBy release];
	preparedBy = nil;
	[referenceID release];
	referenceID = nil;
	[remarks release];
	remarks = nil;
	[userID release];
	userID = nil;

	[super dealloc];
}

@end
