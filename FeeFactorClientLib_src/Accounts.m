//
//  Accounts.m
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

#import "Accounts.h"
#import "RestTransport3.h"
#import "XmlParser.h"
#import "NetmoboFeefactorModel.h"

static NSString *NAME_SPACE_SUBSCRIBER = @"http://accounts.feefactor.com";

@implementation Accounts

//@synthesize transport3;
//@synthesize xmlParser;

- (void)dealloc
{
//	[transport3 release];
//	transport3 = nil;
//	[xmlParser release];
//	xmlParser = nil;

	[super dealloc];
}

//-(id)init{
//	[super init];
//	self.transport3 = [[RestTransport3 alloc] init];
//	self.xmlParser = [[XmlParser alloc] init];
//	return self;
//}

-(Account *)getAccount:(NSNumber *)serialNumber{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	NSDictionary *accountDic = [NSDictionary dictionaryWithObject:[serialNumber stringValue] forKey:@"serialNumber"];
	NSString *returnStr = [transport3 doGet:@"Accounts" params:accountDic];
	Account *getAccount = [[[Account alloc] init] autorelease];
	NSMutableArray *accountArray = (NSMutableArray *)[xmlParser fromXml:returnStr withObject:getAccount];
	if ([accountArray count] > 0) {
		return [accountArray objectAtIndex:0];
	}
	
	return nil;
}

-(int)updateAccount:(Account *)account{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	NSString *updateStr = [xmlParser toXml:account andTag:@"Account" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[XmlParser getResult:[transport3 doPost:@"/Accounts" with:updateStr and:nil]] intValue];
	
}

-(long)insertAccount:(Account *)account andParams:(NSString *)reason{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *insertStr = [xmlParser toXml:account andTag:@"Account" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPut:@"/Accounts" with:insertStr and:reasonDic] longLongValue];
	
}

-(int)deleteAccount:(NSNumber *)serialNumber{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	
	NSDictionary *accountDic = [NSDictionary dictionaryWithObject:[serialNumber stringValue] forKey:@"serialNumber"];
	return [transport3 doDelete:@"/Accounts" with:accountDic];
}

-(AccountSearchResult *)getAccounts:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	Account *getAccount = [[[Account alloc] init] autorelease];
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	AccountSearchResult *accountSearchResult = [[[AccountSearchResult alloc] init] autorelease];
	accountSearchResult.accountResults = [NSMutableArray arrayWithArray:[xmlParser fromXml:[transport3 doGet:@"Accounts/search" params:paramsDic] withObject:getAccount]];
	return accountSearchResult;
}


-(int)refreshAccount:(NSNumber *)serialNumber andParams:(NSString *)reason{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	
	NSArray *keys = [NSArray arrayWithObjects:@"serialNumber", @"reason", nil];
	NSArray *objects = [NSArray arrayWithObjects:[serialNumber stringValue], reason, nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	return [[XmlParser getResult:[transport3 doPost:@"/Accounts/refresh" with:nil and:paramsDic]] intValue];
}

-(int)getAccountCount:(NSString *)where{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	
	NSDictionary *conditionDic = [NSDictionary dictionaryWithObject:where forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Accounts/count/" params:conditionDic]; 
	return [[XmlParser getResult:resultStri] intValue];
	
}

-(AccountRC *)getAccountRC:(NSNumber *)accountRCID{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	NSDictionary *accountRCDic = [NSDictionary dictionaryWithObject:[accountRCID stringValue] forKey:@"accountRCID"];
	NSString *returnStr = [transport3 doGet:@"/Accounts/recurringCharges/" params:accountRCDic];
	AccountRC *getAccountRC = [[AccountRC alloc] init];
	NSArray *accountRCArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getAccountRC];
	[getAccountRC release];
	
	if ([accountRCArray count] > 0) {
		
		return [accountRCArray objectAtIndex:0];
	}
	return nil;

}

-(AccountRCSearchResult *)getAccountRCs:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	AccountRC *getAccountRC = [[AccountRC alloc] init];
	
	AccountRCSearchResult *accountRCSearchResult = [[[AccountRCSearchResult alloc] init] autorelease];
	
	NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc] init];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	accountRCSearchResult.accountRCResults = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Accounts/recurringCharges/search/" params:paramsDic] withObject:getAccountRC];
	
	[paramsDic release];
	[getAccountRC release];
	
	return accountRCSearchResult;
}

-(long)insertAccountRC:(AccountRC *)accountRC andParams:(NSString *)reason{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *insertStr = [xmlParser toXml:accountRC andTag:@"AccountRC" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPut:@"/Accounts/recurringCharges/" with:insertStr and:reasonDic] longLongValue];
	
}

-(int)deleteAccountRC:(NSNumber *)accountRCId{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	
	NSDictionary *accountRCDic = [NSDictionary dictionaryWithObject:[accountRCId stringValue] forKey:@"accountRCID"];
	return [transport3 doDelete:@"/Accounts/recurringCharges/" with:accountRCDic];
}

-(int)getAccountPlanHistoriesCount:(NSNumber *)serialNumber andCondition:(NSString *)where{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	
	NSArray *keys = [NSArray arrayWithObjects:@"serialNumber", @"whereCondition",nil];
	NSArray *objects = [NSArray arrayWithObjects:[serialNumber stringValue], where,nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	NSString *resultStri = [transport3 doGet:@"/Accounts/plan/history/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] intValue];
	
}

-(int)getAccountPlansCount:(NSNumber *)serialNumber andCondition:(NSString *)where{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	
	NSArray *keys = [NSArray arrayWithObjects:@"serialNumber", @"whereCondition",nil];
	NSArray *objects = [NSArray arrayWithObjects:[serialNumber stringValue], where,nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	NSString *resultStri = [transport3 doGet:@"/Accounts/plan/schedule/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] intValue];
	
}

-(int)rechargeAccountManual:(NSNumber *)serialNumber withAmount:(NSNumber *) amount withReferenceID:(NSString *) referenceID withTransactionType:(NSString *)transactionType andReason:(NSString *)reason{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	
	NSArray *keys = [NSArray arrayWithObjects:@"serialNumber", @"amount", @"referenceID",@"transactionType",@"reason",nil];
	NSArray *objects = [NSArray arrayWithObjects:[serialNumber stringValue],[amount stringValue],referenceID,transactionType,reason,nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	
	NSString *resultStri = [transport3 doPut:@"/Accounts/recharge/manual" with:@"none" and:paramsDic]; 
	
	return [[XmlParser getResult:resultStri] intValue];
}

-(int)rechargeAccountViaTransient:(NSNumber *)targetSerialNumber withSource:(NSNumber *) sourceSerialNumber withAmount:(NSNumber *) amount andReason:(NSString *)reason{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	
	NSArray *keys = [NSArray arrayWithObjects:@"targetSerialNumber", @"sourceSerialNumber",@"amount",@"reason",nil];
	NSArray *objects = [NSArray arrayWithObjects:[targetSerialNumber stringValue],[sourceSerialNumber stringValue],[amount stringValue],reason,nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	return [[XmlParser getResult:[transport3 doPost:@"/Accounts/recharge/transient/" with:nil and:paramsDic]] intValue]; 	
}

-(AccountPlanSearchResult *)getAccountPlans:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	AccountPlan *getAccountPlan = [[[AccountPlan alloc] init] autorelease];
	AccountPlanSearchResult *accountPlanSearchResult = [[[AccountPlanSearchResult alloc] init] autorelease];
	NSArray *keys = [NSArray arrayWithObjects:@"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
	NSArray *objects = [NSArray arrayWithObjects:where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	accountPlanSearchResult.accountPlanResults = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Accounts/plan/schedule/search/" params:paramsDic] withObject:getAccountPlan];
	return accountPlanSearchResult;
}

-(AccountPlanSearchResult *)getAccountPlanHistories:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	AccountPlan *getAccountPlan = [[[AccountPlan alloc] init] autorelease];
	AccountPlanSearchResult *accountPlanSearchResult = [[[AccountPlanSearchResult alloc] init] autorelease];
	NSArray *keys = [NSArray arrayWithObjects:@"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
	NSArray *objects = [NSArray arrayWithObjects:where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	accountPlanSearchResult.accountPlanResults = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Accounts/plan/history/search/" params:paramsDic] withObject:getAccountPlan];
	return accountPlanSearchResult;
	
}

-(long)generateAccounts:(Account *)account withQuantity:(NSNumber *)quantity andCaps:(Boolean)allCaps andIDPattern:(NSString *)accountIDPattern andNotifyAdminStatus:(Boolean)notifyAdmin andNotifyUserStatus:(Boolean)notifyUser withReason:(NSString *)reason{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	NSArray *keys = [NSArray arrayWithObjects:@"quantity", @"allCaps",@"AccountIDPattern",@"notifyAdmin",@"notifyUser",@"reason",nil];
	NSArray *objects = [NSArray arrayWithObjects:[quantity stringValue],allCaps,accountIDPattern,notifyAdmin,notifyUser,reason,nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	NSString *insertStr = [xmlParser toXml:account andTag:@"Account" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPut:@"/Accounts/generate/" with:insertStr and:paramsDic] longLongValue];
}

-(int)scheduleSubscription:(AccountPlan *)accountPlan withReason:(NSString *)reason{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	NSString *updateStr = [xmlParser toXml:accountPlan andTag:@"Account" inNameSpace:NAME_SPACE_SUBSCRIBER];
//	NSLog(@"scheduleSubscription XML: %@", updateStr);
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
//	return [[XmlParser getResult: [transport3 doPost:@"/Accounts/plan/schedule/" with:updateStr and:reasonDic]] intValue]; 
	return [[XmlParser getResult: [transport3 doPut:@"/Accounts/plan/schedule/" with:updateStr and:reasonDic]] intValue]; 
}

-(int)getAccountRCsCount:(NSNumber *)brandID withCondition:(NSString *)where{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"whereCondition",nil];
	NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],where,nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	NSString *resultStri = [transport3 doGet:@"/Accounts/recurringCharges/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] intValue];
	
}

-(AccountHistorySearchResult *)getAccountHistories:(NSNumber *)serialNumber andCondition:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	RestTransport3 *transport3 = [[[RestTransport3 alloc] init] autorelease];
	XmlParser *xmlParser = [[[XmlParser alloc] init] autorelease];
	
	AccountHistory *getAccountHistory = [[[AccountHistory alloc] init] autorelease];
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[serialNumber stringValue] forKey:@"serialNumber"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	AccountHistorySearchResult *accountHistorySearchResult = [[[AccountHistorySearchResult alloc] init] autorelease];
	accountHistorySearchResult.accountHistoryResults = [NSMutableArray arrayWithArray:[xmlParser fromXml:[transport3 doGet:@"Accounts/history/search" params:paramsDic] withObject:getAccountHistory]];
	return accountHistorySearchResult;
}

@end
