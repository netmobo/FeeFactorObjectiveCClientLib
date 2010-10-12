//
//  CardTransactionHistory.m
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
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

#import "CardTransactionHistory.h"


@implementation CardTransactionHistory

@synthesize adminID;
@synthesize amount;
@synthesize application;
@synthesize authoCode;
@synthesize buyerAuthID;
@synthesize cardHistoryID;
@synthesize cardNumber;
@synthesize credited;
@synthesize currency;
@synthesize date;
@synthesize fraudScore;
@synthesize fraudScoreSource;
@synthesize gatewayID;
@synthesize invoiceNumber;
@synthesize ipAddress;
@synthesize merchantRefID;
@synthesize payee;
@synthesize payeeID;
@synthesize payer;
@synthesize rechargeCategory;
@synthesize rechargeLevel;
@synthesize remarks;
@synthesize result;
@synthesize sessionID;
@synthesize transactionReferenceID;
@synthesize transactionSerialNo;
@synthesize transactionType;
@synthesize userID;
@synthesize voided;

- (void)dealloc
{
	[adminID release];
	adminID = nil;
	[amount release];
	amount = nil;
	[application release];
	application = nil;
	[authoCode release];
	authoCode = nil;
	[buyerAuthID release];
	buyerAuthID = nil;
	[cardHistoryID release];
	cardHistoryID = nil;
	[cardNumber release];
	cardNumber = nil;
	[currency release];
	currency = nil;
	[date release];
	date = nil;
	[fraudScore release];
	fraudScore = nil;
	[fraudScoreSource release];
	fraudScoreSource = nil;
	[gatewayID release];
	gatewayID = nil;
	[invoiceNumber release];
	invoiceNumber = nil;
	[ipAddress release];
	ipAddress = nil;
	[merchantRefID release];
	merchantRefID = nil;
	[payee release];
	payee = nil;
	[payeeID release];
	payeeID = nil;
	[payer release];
	payer = nil;
	[rechargeCategory release];
	rechargeCategory = nil;
	[rechargeLevel release];
	rechargeLevel = nil;
	[remarks release];
	remarks = nil;
	[result release];
	result = nil;
	[sessionID release];
	sessionID = nil;
	[transactionReferenceID release];
	transactionReferenceID = nil;
	[transactionSerialNo release];
	transactionSerialNo = nil;
	[transactionType release];
	transactionType = nil;
	[userID release];
	userID = nil;

	[super dealloc];
}

@end
