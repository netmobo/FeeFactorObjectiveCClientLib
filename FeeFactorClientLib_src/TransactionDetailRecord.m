//
//  TransactionDetailRecord.m
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

#import "TransactionDetailRecord.h"


@implementation TransactionDetailRecord

@synthesize accountBatchNumber;
@synthesize accountID;
@synthesize accountType;
@synthesize brandExchangeCode;
@synthesize brandID;
@synthesize brandName;
@synthesize brandProductID;
@synthesize brandServiceID;
@synthesize brandServiceName;
@synthesize charge;
@synthesize currency;
@synthesize description;
@synthesize destination;
@synthesize errorCode;
@synthesize initialBrandBaserate;
@synthesize localCharge;
@synthesize planCharge;
@synthesize planDescription;
@synthesize planID;
@synthesize productCode;
@synthesize quantity;
@synthesize serialNumber;
@synthesize sessionID;
@synthesize status;
@synthesize time;
@synthesize transactionDetailRecordID;
@synthesize unitPrice;
@synthesize userAntiTdr;
@synthesize userBrID;
@synthesize userID;
@synthesize username;

- (void)dealloc
{
	[accountBatchNumber release];
	accountBatchNumber = nil;
	[accountID release];
	accountID = nil;
	[accountType release];
	accountType = nil;
	[brandExchangeCode release];
	brandExchangeCode = nil;
	[brandID release];
	brandID = nil;
	[brandName release];
	brandName = nil;
	[brandProductID release];
	brandProductID = nil;
	[brandServiceID release];
	brandServiceID = nil;
	[brandServiceName release];
	brandServiceName = nil;
	[charge release];
	charge = nil;
	[currency release];
	currency = nil;
	[description release];
	description = nil;
	[destination release];
	destination = nil;
	[errorCode release];
	errorCode = nil;
	[initialBrandBaserate release];
	initialBrandBaserate = nil;
	[localCharge release];
	localCharge = nil;
	[planCharge release];
	planCharge = nil;
	[planDescription release];
	planDescription = nil;
	[planID release];
	planID = nil;
	[productCode release];
	productCode = nil;
	[quantity release];
	quantity = nil;
	[serialNumber release];
	serialNumber = nil;
	[sessionID release];
	sessionID = nil;
	[status release];
	status = nil;
	[time release];
	time = nil;
	[transactionDetailRecordID release];
	transactionDetailRecordID = nil;
	[unitPrice release];
	unitPrice = nil;
	[userAntiTdr release];
	userAntiTdr = nil;
	[userBrID release];
	userBrID = nil;
	[userID release];
	userID = nil;
	[username release];
	username = nil;

	[super dealloc];
}

@end
