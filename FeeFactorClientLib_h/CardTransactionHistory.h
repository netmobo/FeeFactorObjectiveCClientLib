//
//  CardTransactionHistory.h
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

#import <Foundation/Foundation.h>


@interface CardTransactionHistory : NSObject {
	
	@protected
	NSNumber *adminID;
    NSNumber *amount;
    NSNumber *application;
    NSNumber *authoCode;
    NSNumber *buyerAuthID;
    NSNumber *cardHistoryID;
    NSNumber *cardNumber;
    Boolean credited;
    NSNumber *currency;
    NSNumber *date;
    NSNumber *fraudScore;
    NSNumber *fraudScoreSource;
    NSNumber *gatewayID;
    NSNumber *invoiceNumber;
    NSNumber *ipAddress;
    NSNumber *merchantRefID;
    NSNumber *payee;
    NSNumber *payeeID;
    NSNumber *payer;
    NSNumber *rechargeCategory;
    NSNumber *rechargeLevel;
    NSNumber *remarks;
    NSNumber *result;
    NSNumber *sessionID;
    NSNumber *transactionReferenceID;
    NSNumber *transactionSerialNo;
    NSNumber *transactionType;
    NSNumber *userID;
    Boolean voided;
	

}

@property (nonatomic, retain) NSNumber *adminID;
@property (nonatomic, retain) NSNumber *amount;
@property (nonatomic, retain) NSNumber *application;
@property (nonatomic, retain) NSNumber *authoCode;
@property (nonatomic, retain) NSNumber *buyerAuthID;
@property (nonatomic, retain) NSNumber *cardHistoryID;
@property (nonatomic, retain) NSNumber *cardNumber;
@property (nonatomic, assign) Boolean credited;
@property (nonatomic, retain) NSNumber *currency;
@property (nonatomic, retain) NSNumber *date;
@property (nonatomic, retain) NSNumber *fraudScore;
@property (nonatomic, retain) NSNumber *fraudScoreSource;
@property (nonatomic, retain) NSNumber *gatewayID;
@property (nonatomic, retain) NSNumber *invoiceNumber;
@property (nonatomic, retain) NSNumber *ipAddress;
@property (nonatomic, retain) NSNumber *merchantRefID;
@property (nonatomic, retain) NSNumber *payee;
@property (nonatomic, retain) NSNumber *payeeID;
@property (nonatomic, retain) NSNumber *payer;
@property (nonatomic, retain) NSNumber *rechargeCategory;
@property (nonatomic, retain) NSNumber *rechargeLevel;
@property (nonatomic, retain) NSNumber *remarks;
@property (nonatomic, retain) NSNumber *result;
@property (nonatomic, retain) NSNumber *sessionID;
@property (nonatomic, retain) NSNumber *transactionReferenceID;
@property (nonatomic, retain) NSNumber *transactionSerialNo;
@property (nonatomic, retain) NSNumber *transactionType;
@property (nonatomic, retain) NSNumber *userID;
@property (nonatomic, assign) Boolean voided;

@end
