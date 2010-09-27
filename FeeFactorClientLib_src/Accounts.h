//
//  Accounts.h
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
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

#import <Foundation/Foundation.h>
#import "RestTransport3.h"
#import "XmlParser.h"
#import "Account.h"
#import "AccountHistory.h"
#import "AccountSearchResult.h"
#import "AccountRC.h"
#import "AccountRCSearchResult.h"
#import "AccountPlanSearchResult.h"
#import "AccountPlan.h"
#import "AccountHistorySearchResult.h"

@interface Accounts : NSObject {

    @protected
	RestTransport3 *transport3;
	XmlParser *xmlParser;
}

@property (nonatomic, retain) RestTransport3 *transport3;
@property (nonatomic, retain) XmlParser *xmlParser;

-(Account *)getAccount:(NSNumber *)serialNumber;
-(int)updateAccount:(Account *)account;
-(long)insertAccount:(Account *)account andParams:(NSString *)reason;
-(int)deleteAccount:(NSNumber *)serialNumber;
-(AccountSearchResult *)getAccounts:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(int)refreshAccount:(NSNumber *)serialNumber andParams:(NSString *)reason;
-(int)getAccountCount:(NSString *)where;
-(AccountRC *)getAccountRC:(NSNumber *)accountRCID;
-(AccountRCSearchResult *)getAccountRCs:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)insertAccountRC:(AccountRC *)accountRC andParams:(NSString *)reason;
-(int)deleteAccountRC:(NSNumber *)accountRCId;
-(int)getAccountPlanHistoriesCount:(NSNumber *)serialNumber andCondition:(NSString *)where;
-(int)getAccountPlansCount:(NSNumber *)serialNumber andCondition:(NSString *)where;
-(int)rechargeAccountManual:(NSNumber *)serialNumber withAmount:(NSNumber *) amount withReferentceID:(NSString *) referenceID withTransactionType:(NSString *)transactionType andReason:(NSString *)reason;
-(int)rechargeAccountViaTransient:(NSNumber *)targetSerialNumber withSource:(NSNumber *) sourceSerialNumber withAmount:(NSNumber *) amount andReason:(NSString *)reason;
-(AccountPlanSearchResult *)getAccountPlans:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(AccountPlanSearchResult *)getAccountPlanHistories:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)generateAccounts:(Account *)account withQuantity:(NSNumber *)quantity andCaps:(Boolean)allCaps andIDPattern:(NSString *)accountIDPattern andNotifyAdminStatus:(Boolean)notifyAdmin andNotifyUserStatus:(Boolean)notifyUser withReason:(NSString *)reason;
-(int)scheduleSubscription:(AccountPlan *)accountPlan withReason:(NSString *)reason;
-(int)getAccountRCsCount:(NSNumber *)brandID withCondition:(NSString *)where;
-(AccountHistorySearchResult *)getAccountHistories:(NSNumber *)serialNumber andCondition:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;

@end
