//
//  CardPayments.m
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
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

#import "CardPayments.h"


static NSString *NAME_SPACE_SUBSCRIBER = @"http://paymentsystem.feefactor.com";

@implementation CardPayments

@synthesize transport3;
@synthesize xmlParser;

- (void)dealloc
{
	[transport3 release];
	transport3 = nil;
	[xmlParser release];
	xmlParser = nil;
	
	[super dealloc];
}

-(id)init{
	
	[super init];
	transport3 = [[RestTransport3 alloc] init];
	xmlParser = [[XmlParser alloc] init];
	return self;
}

-(long)getUserCardsCount:(NSString *)whereCondition{
	
	NSMutableDictionary *cardDic = [NSMutableDictionary dictionaryWithObject:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/CardPayments/card/user/count/" params:cardDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
	
}

-(long)insertUserCard:(UserCard *)card andParams:(NSString *)reason{
	
	NSMutableDictionary *reasonDic = [NSMutableDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *insertStr = [xmlParser toXml:card andTag:@"UserCard" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPut:@"/CardPayments/card/user/" with:insertStr and:reasonDic] longLongValue];
	
}

-(long)rechargeAccountViaCC:(NSString *)paymentGatewayID withSerial:(NSNumber *)serialNumber andLoad:(NSNumber *)load anFirstName:(NSString *)firstName andLastName:(NSString *)lastName andEmail:(NSString *)email andPhone:(NSString *)phoneNumber  andAddr1:(NSString *)address1 
				   andAddr2:(NSString *)address2 andCity:(NSString *)city andState:(NSString *)state andZip:(NSString *)zip andCountry:(NSString *)country andCardNum:(NSString *)cardNumber 
				andExpMonth:(NSString *)expirationMonth andExpYear:(NSString *)expirationYear andCardType:(NSString *)cardType andCvv:(NSString *)cvv andDescripion:(NSString *)description 
	   andMerchatDescriptor:(NSString *)merchantDescriptor andMerchatPhone:(NSString *)merchatPhone andComment:(NSString *)comment andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	
	[paramsDic setValue:paymentGatewayID forKey:@"paymentGatewayID"];
	[paramsDic setValue:[serialNumber stringValue] forKey:@"serialNumber"];
	[paramsDic setValue:[load stringValue] forKey:@"load"];
	[paramsDic setValue:firstName forKey:@"firstName"];
	[paramsDic setValue:lastName forKey:@"lastName"];
	[paramsDic setValue:email forKey:@"email"];
	[paramsDic setValue:phoneNumber forKey:@"phoneNumber"];
	[paramsDic setValue:address1 forKey:@"address1"];
	[paramsDic setValue:address2 forKey:@"address2"];
	[paramsDic setValue:city forKey:@"city"];
	[paramsDic setValue:state forKey:@"state"];
	[paramsDic setValue:zip forKey:@"zip"];
	[paramsDic setValue:country forKey:@"country"];
	[paramsDic setValue:cardNumber forKey:@"cardNumber"];
	[paramsDic setValue:expirationMonth forKey:@"expirationMonth"];
	[paramsDic setValue:expirationYear forKey:@"expirationYear"];
	[paramsDic setValue:cardType forKey:@"cardType"];
	[paramsDic setValue:cvv forKey:@"cvv"];
	[paramsDic setValue:description forKey:@"description"];
	[paramsDic setValue:merchantDescriptor forKey:@"merchantDescriptor"];
	[paramsDic setValue:merchatPhone forKey:@"merchatPhone"];
	[paramsDic setValue:comment forKey:@"comment"];
	[paramsDic setValue:reason forKey:@"reason"];
	
	return [[XmlParser getResult: [transport3 doPost:@"/CardPayments/card/account/recharge" with:nil and:paramsDic]] longLongValue];
	
	
	//	long result = [[XmlParser getResult:[transport3 doPost:@"/CardPayments/card/account/recharge" with:nil and:paramsDic]] longLongValue];
	//	[paramsDic release];
	//	
	//	return result;
}

-(long)getCardTransactionHistoriesCount:(NSNumber *)serialNumber withCondition:(NSString *)where{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[serialNumber stringValue] forKey:@"serialNumber"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/CardPayments/History/Account/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
	
}

-(int)updateUserBankAccount:(UserBankAccount *)bankAccount andParams:(NSString *)reason{
	
	NSMutableDictionary *reasonDic = [NSMutableDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *updateStr = [xmlParser toXml:bankAccount andTag:@"UserBankAccount" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[XmlParser getResult: [transport3 doPost:@"/CardPayments/bankAccount/user/" with:updateStr and:reasonDic]] intValue];
	
}

-(int)reverseCardTransaction:(NSNumber *)paymentGatewayID withSource:(NSNumber *) serialNumber withHistoryID:(NSNumber *) cardHistoryID andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:paymentGatewayID forKey:@"paymentGatewayID"];
	[paramsDic setValue:[serialNumber stringValue] forKey:@"serialNumber"];
	[paramsDic setValue:reason forKey:@"reason"];
	[paramsDic setValue:[cardHistoryID stringValue] forKey:@"cardHistoryID"];
	return [[XmlParser getResult: [transport3 doPost:@"/CardPayments/card/account/recharge/reverse" with:nil and:paramsDic]] intValue]; 	
}

-(UserCard *)getUserCard:(NSNumber *)cardID{
	NSMutableDictionary *brandDic = [NSMutableDictionary dictionaryWithObject:[cardID stringValue] forKey:@"cardID"];
	NSString *returnStr = [transport3 doGet:@"/CardPayments/card/user/" params:brandDic];
	UserCard *getUserCard = [[UserCard alloc] init];
	NSArray *userCardArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getUserCard];
	[getUserCard release];
	if ([userCardArray count] > 0) {
		
		return [userCardArray objectAtIndex:0];
	}
	return nil;
}

-(int)updateUserCard:(UserCard *)card andParams:(NSString *)reason{
	
	NSMutableDictionary *reasonDic = [NSMutableDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *updateStr = [xmlParser toXml:card andTag:@"UserCard" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[XmlParser getResult: [transport3 doPost:@"/CardPayments/card/user/" with:updateStr and:reasonDic]] intValue];
	
}

-(UserBankAccount *)getUserBankAccount:(NSNumber *)bankAccountID{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[bankAccountID stringValue]forKey:@"bankAccountID"];
	UserBankAccount *bankAcc = [[UserBankAccount alloc] init];
	NSString *content = [transport3 doGet:@"/CardPayments/bankAccount/user/" params:paramsDic];
	NSArray *accArray = (NSArray *)[xmlParser fromXml:content withObject:bankAcc];
	[bankAcc release];
	if ([accArray count] > 0) {
		
		return [accArray objectAtIndex:0];
	}
	return nil;
}

-(long)insertUserBankAccount:(UserBankAccount *)bankAccount andParams:(NSString *)reason{
	
	NSMutableDictionary *reasonDic = [NSMutableDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *insertStr = [xmlParser toXml:bankAccount andTag:@"UserCard" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPut:@"/CardPayments/card/user/" with:insertStr and:reasonDic] longLongValue];	
	
}

-(int)deleteUserBankAccount:(NSNumber *)bankAccountID andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[bankAccountID stringValue] forKey:@"bankAccountID"];
	[paramsDic setValue:reason forKey:@"reason"];
	
	return [transport3 doDelete:@"/CardPayments/bankAccount/user/" with:paramsDic];
}

-(NSString *)getUserBankAccountProperty:(NSString *)propertyName andAccountID:(NSNumber *)bankAccountID{
	
	NSMutableDictionary *accountDic = [NSMutableDictionary dictionaryWithObject:[bankAccountID stringValue] forKey:@"bankAccountID"];
	NSString *requestStr = [NSString stringWithFormat:@"%@%@",@"/CardPayments/bankAccount/user/",propertyName];
	NSString *returnStr = [transport3 doGet:requestStr params:accountDic];
	UserBankAccount *getUserBankAccount = [[[UserBankAccount alloc] init] autorelease];
	NSArray *getUserBankAccountArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getUserBankAccount];
	if ([getUserBankAccountArray count]) {
		
		return [[getUserBankAccount valueForKey:propertyName] stringValue];
	}
	return nil;
}

-(CardTransactionHistory *)getCardTransactionHistory:(NSNumber *)serialNumber andCardHistoryID:(NSNumber *)cardHistoryID{
	
	NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc] init];
	[paramsDic setValue:[serialNumber stringValue] forKey:@"serialNumber"];
	[paramsDic setValue:[cardHistoryID stringValue] forKey:@"cardHistoryID"];
	// NSLog(@"params dic ok");
	CardTransactionHistory *cardTransactionHistory = [[CardTransactionHistory alloc] init];
	CardTransactionHistory *cardTrHistory = (CardTransactionHistory *)[xmlParser fromXml:[transport3 doGet:@"/CardPayments/History/Account/" params:paramsDic] withObject:cardTransactionHistory];
	[paramsDic release];
	[cardTransactionHistory release];
	return cardTrHistory;
	
}

-(int)deleteUserCard:(NSNumber *)cardID andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[cardID stringValue] forKey:@"cardID"];
	[paramsDic setValue:reason forKey:@"reason"];
	
	return [transport3 doDelete:@"/CardPayments/card/user/" with:paramsDic];
}

-(NSString *)getUserCardProperty:(NSString *)propertyName andAccountID:(NSNumber *)cardID{
	
	NSMutableDictionary *accountDic = [NSMutableDictionary dictionaryWithObject:[cardID stringValue] forKey:@"cardID"];
	NSString *requestStr = [NSString stringWithFormat:@"%@%@",@"/CardPayments/card/user/",propertyName];
	NSString *returnStr = [transport3 doGet:requestStr params:accountDic];
	UserCard *getUserCard = [[[UserCard alloc] init] autorelease];
	NSArray *getUserCardArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getUserCard];
	if ([getUserCardArray count]) {
		
		return [[getUserCard valueForKey:propertyName] stringValue];
	}
	return nil;
}

-(long)getUserBankAccountsCount:(NSString *)whereCondition{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/CardPayments/bankAccount/user/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
	
}

-(UserCardSearchResult *)getUserCards:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	UserCard *getUserCard = [[[UserCard alloc] init] autorelease];
	
	UserCardSearchResult *getUserCardSearchResult = [[[UserCardSearchResult alloc] init] autorelease];
	getUserCardSearchResult.results = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/CardPayments/card/user/search/" params:paramsDic] withObject:getUserCard];
	return getUserCardSearchResult;
	
}

-(CardTransactionHistorySearchResult *)getCardTransactionHistories:(NSNumber *)serialNumber andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc] init];
	
	[paramsDic setValue:[serialNumber stringValue] forKey:@"serialNumber"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	CardTransactionHistory *getCardTransactionHistory = [[CardTransactionHistory alloc] init];
	
	CardTransactionHistorySearchResult *getCardTransactionHistorySearchResult= [[CardTransactionHistorySearchResult alloc] init];
	getCardTransactionHistorySearchResult.searchResult = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/CardPayments/History/Account/search/" params:paramsDic] withObject:getCardTransactionHistory];
	
	[getCardTransactionHistory release];
	[paramsDic release];
	
	return getCardTransactionHistorySearchResult;
	
}

-(UserBankAccountSearchResult *)getUserBankAccounts:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	UserBankAccount *getUserBankAccount = [[[UserBankAccount alloc] init] autorelease];
	
	UserBankAccountSearchResult *getUserBankAccountSearchResult = [[[UserBankAccountSearchResult alloc] init] autorelease];
	getUserBankAccountSearchResult.AccountSearchResult = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/CardPayments/bankAccount/user/search/" params:paramsDic] withObject:getUserBankAccount];
	return getUserBankAccountSearchResult;
	
}

-(long)processAccountCheckout:(NSNumber *)paymentGatewayID andSerialNum:(NSNumber *)serialNumber andData:(NSString *)checkoutData{
	
	NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc] init];
	[paramsDic setValue:[paymentGatewayID stringValue] forKey:@"paymentGatewayID"];
	[paramsDic setValue:[serialNumber stringValue] forKey:@"serialNumber"];
	[paramsDic setValue:checkoutData forKey:@"checkoutData"];
//	NSString *result = [transport3 doPost:@"/CardPayments/checkout/account/process" with:@"" and:paramsDic];
	
	NSLog(@"paymentGatewayID: %@ serialNumber: %@ checkoutData: %@", [paymentGatewayID stringValue], [serialNumber stringValue], checkoutData);
	
	
	NSString *result = [transport3 doPut:@"/CardPayments/checkout/account/process" with:@"" and:paramsDic];
	// NSLog(@"the result is %@",result);
	[paramsDic release];
	return [[XmlParser getResult:result] longLongValue];	
}


-(long)rechargeAccountViaUserCard:(NSNumber *)paymentGatewayID andSerialNum:(NSNumber *)serialNumber andLoad:(NSNumber *)load andCardID:(NSNumber *)cardID andCVV:(NSString *)cvv andDescription:(NSString *)description andmerchantDescriptor:(NSString *)merchantDescriptor andmerchantPhone:(NSString *)merchantPhone andComment:(NSString *)comment{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:paymentGatewayID forKey:@"paymentGatewayID"];
	[paramsDic setValue:serialNumber forKey:@"serialNumber"];
	[paramsDic setValue:[load stringValue] forKey:@"load"];
	[paramsDic setValue:[cardID stringValue] forKey:@"cardID"];
	[paramsDic setValue:cvv forKey:@"cvv"];
	[paramsDic setValue:description forKey:@"description"];
	[paramsDic setValue:merchantDescriptor forKey:@"merchantDescriptor"];
	[paramsDic setValue:merchantPhone forKey:@"merchantPhone"];
	[paramsDic setValue:comment forKey:@"comment"];
	
	NSString *resultStr = [transport3 doPost:@"/CardPayments/card/account/recharge/registered" with:@"" and:paramsDic];
	return [[XmlParser getResult:resultStr] longLongValue];
}

-(long)insertUserPaymentAuthorization:(UserPaymentAuthorization *)paymentAuthorization andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:reason forKey:@"reason"];
	NSString *insertStr = [xmlParser toXml:paymentAuthorization andTag:@"UserPaymentAuthorization" inNameSpace:NAME_SPACE_SUBSCRIBER];
	NSString *resultStr = [transport3 doPut:@"/CardPayments/paymentAuthorization/user" with:insertStr and:paramsDic];
	if(resultStr){
		
		return [resultStr longLongValue];
		
	}
	return 0;
}

-(long)updateUserPaymentAuthorization:(UserPaymentAuthorization *)paymentAuthorization andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:reason forKey:@"reason"];
	NSString *insertStr = [xmlParser toXml:paymentAuthorization andTag:@"UserPaymentAuthorization" inNameSpace:NAME_SPACE_SUBSCRIBER];
	NSString *resultStr = [transport3 doPost:@"/CardPayments/paymentAuthorization/user" with:insertStr and:paramsDic];
	
	if(resultStr){
		
		return [resultStr longLongValue];
		
	}
	return 0;
}

-(UserPaymentAuthorization *)getUserPaymentAuthorization:(NSNumber *)paymentAuthorizationID{
	
	UserPaymentAuthorization *getAuth = [[UserPaymentAuthorization alloc] init];
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:paymentAuthorizationID forKey:@"paymentAuthorizationID"];
	NSString *resultStr = [transport3 doGet:@"/CardPayments/paymentAuthorization/user/" params:paramsDic];
	return [xmlParser fromXml:resultStr withObject:getAuth];
}

-(UserPaymentAuthorizationSearchResult *)getUserPaymentAuthorizations:(NSString *)whereCondition andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:whereCondition forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	UserPaymentAuthorization *getAuth = [[UserPaymentAuthorization alloc] init];
	
	UserPaymentAuthorizationSearchResult *getUserAuthes = [[UserPaymentAuthorizationSearchResult alloc] init];
	getUserAuthes.results = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/CardPayments/paymentAuthorization/user/search/" params:paramsDic] withObject:getAuth];
	return getUserAuthes;
}

-(long)getUserPaymentAuthorizationsCount:(NSString *)whereCondition{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/CardPayments/paymentAuthorization/user/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
}

-(int)deleteUserPaymentAuthorization:(NSNumber *)paymentAuthorizationID andReason:(NSString *)reason{ 
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[paymentAuthorizationID stringValue] forKey:@"paymentAuthorizationID"];
	[paramsDic setValue:reason forKey:@"reason"];
	return [transport3 doDelete:@"/CardPayments/paymentAuthorization/user" with:paramsDic];
}

-(int)addUserCardToPaymentAuthorization:(NSNumber *)paymentAuthorizationID andCardID:(NSNumber *)cardID andPriority:(NSNumber *)priority andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[paymentAuthorizationID stringValue] forKey:@"paymentAuthorizationID"];
	[paramsDic setValue:[cardID stringValue] forKey:@"cardID"];
	[paramsDic setValue:[priority stringValue] forKey:@"priority"];
	[paramsDic setValue:reason forKey:@"reason"];
	
	NSString *resultStr = [transport3 doPost:@"/CardPayments/paymentAuthorization/user/card" with:@"" and:paramsDic];
	return [[XmlParser getResult:resultStr] intValue];
	
}

-(int)removeUserCardFromPaymentAuthorization:(NSNumber *)paymentAuthorizationID andCardID:(NSNumber *)cardID andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[paymentAuthorizationID stringValue] forKey:@"paymentAuthorizationID"];
	[paramsDic setValue:cardID forKey:@"cardID"];
	[paramsDic setValue:reason forKey:@"reason"];
	return [transport3 doDelete:@"/CardPayments/paymentAuthorization/user" with:paramsDic];
}

-(int)addAccountToPaymentAuthorization:(NSNumber *)paymentAuthorizationID andSerialNumber:(NSNumber *)serialNumber andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[paymentAuthorizationID stringValue] forKey:@"paymentAuthorizationID"];
	[paramsDic setValue:[serialNumber stringValue] forKey:@"serialNumber"];
	[paramsDic setValue:reason forKey:@"reason"];
	
	NSString *resultStr = [transport3 doPost:@"/CardPayments/paymentAuthorization/user/account" with:@"" and:paramsDic];
	return [[XmlParser getResult:resultStr] intValue];
}

-(int)removeAccountFromPaymentAuthorization:(NSNumber *)paymentAuthorizationID andSerialNumber:(NSNumber *)serialNumber andReason:(NSString *)reason{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[paymentAuthorizationID stringValue] forKey:@"paymentAuthorizationID"];
	[paramsDic setValue:serialNumber forKey:@"serialNumber"];
	[paramsDic setValue:reason forKey:@"reason"];
	return [transport3 doDelete:@"/CardPayments/paymentAuthorization/user/account" with:paramsDic];
}

-(PaymentGateway *)getBrandPaymentGateway:(NSNumber *)paymentGatewayID{
	NSMutableDictionary *brandDic = [NSMutableDictionary dictionaryWithObject:[paymentGatewayID stringValue] forKey:@"paymentGatewayID"];
	NSString *returnStr = [transport3 doGet:@"/CardPayments/paymentgateway/brand/" params:brandDic];
	PaymentGateway *getPaymentGateway = [[PaymentGateway alloc] init];
	NSArray *paymentGatewayArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getPaymentGateway];
	[getPaymentGateway release];
	if ([paymentGatewayArray count] > 0) {
		
		return [paymentGatewayArray objectAtIndex:0];
	}
	return nil;
}

-(PaymentGatewaySearchResult *)getBrandPaymentGateways:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc] init];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	PaymentGateway *getPaymentGateway = [[PaymentGateway alloc] init];
	
	PaymentGatewaySearchResult *getPaymentGatewaySearchResult = [[PaymentGatewaySearchResult alloc] init];
	getPaymentGatewaySearchResult.paymentGatewayInfoSearchResult = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/CardPayments/paymentgateway/brand/search/" params:paramsDic] withObject:getPaymentGateway];
	[paramsDic release];
	[getPaymentGateway release];
	return [getPaymentGatewaySearchResult autorelease];
	
}

-(long)getBrandPaymentGatewaysCount:(NSString *)whereCondition{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/CardPayments/paymentgateway/brand/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
}

@end
