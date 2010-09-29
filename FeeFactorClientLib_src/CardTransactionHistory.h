//
//  CardTransactionHistory.h
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

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
