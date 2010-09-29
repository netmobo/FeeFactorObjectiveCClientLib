//
//  CardPayments.h
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

#import <Foundation/Foundation.h>
#import "RestTransport3.h"
#import "XmlParser.h"
#import "UserCard.h"
#import "UserBankAccount.h"
#import "CardTransactionHistory.h"
#import "UserCardSearchResult.h"
#import "CardTransactionHistorySearchResult.h"
#import "UserBankAccountSearchResult.h"
#import "UserPaymentAuthorization.h"
#import "UserPaymentAuthorizationSearchResult.h"
#import "PaymentGateway.h"
#import "PaymentGatewaySearchResult.h"

@interface CardPayments : NSObject {
    
@protected
	RestTransport3 *transport3;
	XmlParser *xmlParser;
	
}

@property (nonatomic, retain) RestTransport3 *transport3;
@property (nonatomic, retain) XmlParser *xmlParser;

-(long)getUserCardsCount:(NSString *)whereCondition;
-(long)insertUserCard:(UserCard *)card andParams:(NSString *)reason;
-(long)rechargeAccountViaCC:(NSString *)paymentGatewayID withSerial:(NSNumber *)serialNumber andLoad:(NSNumber *)load anFirstName:(NSString *)firstName andLastName:(NSString *)lastName andEmail:(NSString *)email andPhone:(NSString *)phoneNumber  andAddr1:(NSString *)address1 
				   andAddr2:(NSString *)address2 andCity:(NSString *)city andState:(NSString *)state andZip:(NSString *)zip andCountry:(NSString *)country andCardNum:(NSString *)cardNumber 
				andExpMonth:(NSString *)expirationMonth andExpYear:(NSString *)expirationYear andCardType:(NSString *)cardType andCvv:(NSString *)cvv andDescripion:(NSString *)description 
	   andMerchatDescriptor:(NSString *)merchantDescriptor andMerchatPhone:(NSString *)merchatPhone andComment:(NSString *)comment andReason:(NSString *)reason;
-(long)getCardTransactionHistoriesCount:(NSNumber *)serialNumber withCondition:(NSString *)where;
-(int)updateUserBankAccount:(UserBankAccount *)bankAccount andParams:(NSString *)reason;
-(int)reverseCardTransaction:(NSNumber *)paymentGatewayID withSource:(NSNumber *) serialNumber withHistoryID:(NSNumber *) cardHistoryID andReason:(NSString *)reason;
-(UserCard *)getUserCard:(NSNumber *)cardID;
-(int)updateUserCard:(UserCard *)card andParams:(NSString *)reason;
-(UserBankAccount *)getUserBankAccount:(NSNumber *)bankAccountID;
-(long)insertUserBankAccount:(UserBankAccount *)bankAccount andParams:(NSString *)reason;
-(int)deleteUserBankAccount:(NSNumber *)bankAccountID andReason:(NSString *)reason;
-(NSString *)getUserBankAccountProperty:(NSString *)propertyName andAccountID:(NSNumber *)bankAccountID;
-(CardTransactionHistory *)getCardTransactionHistory:(NSNumber *)serialNumber andCardHistoryID:(NSNumber *)cardHistoryID;
-(int)deleteUserCard:(NSNumber *)cardID andReason:(NSString *)reason;
-(NSString *)getUserCardProperty:(NSString *)propertyName andAccountID:(NSNumber *)cardID;
-(long)getUserBankAccountsCount:(NSString *)whereCondition;
-(UserCardSearchResult *)getUserCards:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(CardTransactionHistorySearchResult *)getCardTransactionHistories:(NSNumber *)serialNumber andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(UserBankAccountSearchResult *)getUserBankAccounts:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)processAccountCheckout:(NSNumber *)paymentGatewayID andSerialNum:(NSNumber *)serialNumber andData:(NSString *)checkoutData;

//changes of 09/07/2010

-(long)rechargeAccountViaUserCard:(NSNumber *)paymentGatewayID andSerialNum:(NSNumber *)serialNumber andLoad:(NSNumber *)load andCardID:(NSNumber *)cardID andCVV:(NSString *)cvv andDescription:(NSString *)description andmerchantDescriptor:(NSString *)merchantDescriptor andmerchantPhone:(NSString *)merchantPhone andComment:(NSString *)comment;
-(long)insertUserPaymentAuthorization:(UserPaymentAuthorization *)paymentAuthorization andReason:(NSString *)reason;
-(long)updateUserPaymentAuthorization:(UserPaymentAuthorization *)paymentAuthorization andReason:(NSString *)reason;
-(UserPaymentAuthorization *)getUserPaymentAuthorization:(NSNumber *)paymentAuthorizationID;
-(UserPaymentAuthorizationSearchResult *)getUserPaymentAuthorizations:(NSString *)whereCondition andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)getUserPaymentAuthorizationsCount:(NSString *)whereCondition;
-(int)deleteUserPaymentAuthorization:(NSNumber *)paymentAuthorizationID andReason:(NSString *)reason;
-(int)addUserCardToPaymentAuthorization:(NSNumber *)paymentAuthorizationID andCardID:(NSNumber *)cardID andPriority:(NSNumber *)priority andReason:(NSString *)reason;
-(int)removeUserCardFromPaymentAuthorization:(NSNumber *)paymentAuthorizationID andCardID:(NSNumber *)cardID andReason:(NSString *)reason;
-(int)addAccountToPaymentAuthorization:(NSNumber *)paymentAuthorizationID andSerialNumber:(NSNumber *)serialNumber andReason:(NSString *)reason;
-(int)removeAccountFromPaymentAuthorization:(NSNumber *)paymentAuthorizationID andSerialNumber:(NSNumber *)serialNumber andReason:(NSString *)reason;

-(PaymentGateway *)getBrandPaymentGateway:(NSNumber *)paymentGatewayID;
-(PaymentGatewaySearchResult *)getBrandPaymentGateways:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)getBrandPaymentGatewaysCount:(NSString *)whereCondition;

@end
