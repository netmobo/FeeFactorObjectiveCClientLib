//
//  Account.m
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
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

#import "Account.h"


@implementation Account

@synthesize accountID;
@synthesize accountPlanID;
@synthesize activationDate;
@synthesize autoActivate;
@synthesize balance;
@synthesize batchNumber;
@synthesize brandID;
@synthesize brandServiceID;
@synthesize creationDate;
@synthesize creator;
@synthesize creditLimit;
@synthesize currencyID;
@synthesize denomination;
@synthesize endRoamDate;
@synthesize expirationDate;
@synthesize firstUseDate;
@synthesize freeRollOverBal;
@synthesize freeValueBal;
@synthesize inactiveAgeLimit;
@synthesize inactiveExpirationDate;
@synthesize initialBalance;
@synthesize lastPlanRefreshDate;
@synthesize lastUseDate;
@synthesize planID;
@synthesize remarks;
@synthesize roaming;
@synthesize serialNumber;
@synthesize settings;
@synthesize simultaneousAccess;
@synthesize status;
@synthesize type;
@synthesize usageAge;
@synthesize usageDate;
@synthesize usageExpirationDate;
@synthesize userID;


- (void)dealloc
{
	[accountID release];
	[accountPlanID release];
	[activationDate release];
	
	[balance release];
	[batchNumber release];
	[brandID release];
	[brandServiceID release];
	[creationDate release];
	[creator release];
	[creditLimit release];
	[currencyID release];
	[denomination release];
	[endRoamDate release];
	[expirationDate release];
	[firstUseDate release];
	[freeRollOverBal release];
	[freeValueBal release];
	[inactiveAgeLimit release];
	[inactiveExpirationDate release];
	[initialBalance release];
	[lastPlanRefreshDate release];
	[lastUseDate release];
	[planID release];
	[remarks release];
	
	[serialNumber release];
	[settings release];
	[simultaneousAccess release];
	[status release];
	[type release];
	[usageAge release];
	[usageDate release];
	[usageExpirationDate release];
	[userID release];
	
	[super dealloc];

}



@end
