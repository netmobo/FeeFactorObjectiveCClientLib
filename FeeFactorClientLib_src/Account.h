//
//  Account.h
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

#import <Foundation/Foundation.h>


@interface Account : NSObject {
	
	
@protected	
	NSString *accountID;
	NSNumber * accountPlanID;
	NSString *activationDate;
	Boolean autoActivate;
	NSNumber * balance;
	NSNumber * batchNumber;
	NSNumber * brandID;
	NSNumber * brandServiceID;
	NSString *creationDate;
	NSString *creator;
	NSNumber * creditLimit;
	NSNumber * currencyID;
	NSNumber * denomination;
	NSString *endRoamDate;
	NSString *expirationDate;
	NSString *firstUseDate;
	NSNumber * freeRollOverBal;
	NSNumber * freeValueBal;
	NSNumber * inactiveAgeLimit;
	NSString *inactiveExpirationDate;
	NSNumber * initialBalance;
	NSString *lastPlanRefreshDate;
	NSString *lastUseDate;
	NSNumber * planID;
	NSString *remarks;
	Boolean roaming;
	NSNumber * serialNumber;
	NSString *settings;
	NSNumber * simultaneousAccess;
	NSString *status;
	NSString *type;
	NSNumber * usageAge;
	NSString *usageDate;
	NSString *usageExpirationDate;
	NSNumber * userID;
}

@property (nonatomic, retain) NSString *accountID;
@property (nonatomic, retain) NSNumber * accountPlanID;
@property (nonatomic, retain) NSString *activationDate;
@property (nonatomic, assign) Boolean autoActivate;
@property (nonatomic, retain) NSNumber * balance;
@property (nonatomic, retain) NSNumber * batchNumber;
@property (nonatomic, retain) NSNumber * brandID;
@property (nonatomic, retain) NSNumber * brandServiceID;
@property (nonatomic, retain) NSString *creationDate;
@property (nonatomic, retain) NSString *creator;
@property (nonatomic, retain) NSNumber * creditLimit;
@property (nonatomic, retain) NSNumber * currencyID;
@property (nonatomic, retain) NSNumber * denomination;
@property (nonatomic, retain) NSString *endRoamDate;
@property (nonatomic, retain) NSString *expirationDate;
@property (nonatomic, retain) NSString *firstUseDate;
@property (nonatomic, retain) NSNumber * freeRollOverBal;
@property (nonatomic, retain) NSNumber * freeValueBal;
@property (nonatomic, retain) NSNumber * inactiveAgeLimit;
@property (nonatomic, retain) NSString *inactiveExpirationDate;
@property (nonatomic, retain) NSNumber * initialBalance;
@property (nonatomic, retain) NSString *lastPlanRefreshDate;
@property (nonatomic, retain) NSString *lastUseDate;
@property (nonatomic, retain) NSNumber * planID;
@property (nonatomic, retain) NSString *remarks;
@property (nonatomic, assign) Boolean roaming;
@property (nonatomic, retain) NSNumber * serialNumber;
@property (nonatomic, retain) NSString *settings;
@property (nonatomic, retain) NSNumber * simultaneousAccess;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSNumber * usageAge;
@property (nonatomic, retain) NSString *usageDate;
@property (nonatomic, retain) NSString *usageExpirationDate;
@property (nonatomic, retain) NSNumber * userID;

@end
