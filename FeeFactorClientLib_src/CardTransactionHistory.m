//
//  CardTransactionHistory.m
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

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
