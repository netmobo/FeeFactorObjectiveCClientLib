//
//  AccountInvoice.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
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

#import "AccountInvoice.h"


@implementation AccountInvoice

@synthesize accountID;
@synthesize amountDue;
@synthesize archived;
@synthesize brandID;
@synthesize currentCharges;
@synthesize dateFrom;
@synthesize dateTo;
@synthesize dueDate;
@synthesize fullyPaid;
@synthesize fullyPaidDate;
@synthesize gmt;
@synthesize invoiceCode;
@synthesize invoiceDate;
@synthesize invoiceNumber;
@synthesize preparedBy;
@synthesize remarks;
@synthesize sentToCustomer;
@synthesize userID;

- (void)dealloc
{
	[accountID release];
	accountID = nil;
	[amountDue release];
	amountDue = nil;
	[brandID release];
	brandID = nil;
	[currentCharges release];
	currentCharges = nil;
	[dateFrom release];
	dateFrom = nil;
	[dateTo release];
	dateTo = nil;
	[dueDate release];
	dueDate = nil;
	[fullyPaid release];
	fullyPaid = nil;
	[fullyPaidDate release];
	fullyPaidDate = nil;
	[gmt release];
	gmt = nil;
	[invoiceCode release];
	invoiceCode = nil;
	[invoiceDate release];
	invoiceDate = nil;
	[invoiceNumber release];
	invoiceNumber = nil;
	[preparedBy release];
	preparedBy = nil;
	[remarks release];
	remarks = nil;
	[userID release];
	userID = nil;

	[super dealloc];
}

@end
