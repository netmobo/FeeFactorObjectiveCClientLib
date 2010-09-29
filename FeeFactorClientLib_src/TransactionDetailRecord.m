//
//  TransactionDetailRecord.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TransactionDetailRecord.h"


@implementation TransactionDetailRecord

@synthesize accountBatchNumber;
@synthesize accountID;
@synthesize accountType;
@synthesize brandExchangeCode;
@synthesize brandID;
@synthesize brandName;
@synthesize brandProductID;
@synthesize brandServiceID;
@synthesize brandServiceName;
@synthesize charge;
@synthesize currency;
@synthesize description;
@synthesize destination;
@synthesize errorCode;
@synthesize initialBrandBaserate;
@synthesize localCharge;
@synthesize planCharge;
@synthesize planDescription;
@synthesize planID;
@synthesize productCode;
@synthesize quantity;
@synthesize serialNumber;
@synthesize sessionID;
@synthesize status;
@synthesize time;
@synthesize transactionDetailRecordID;
@synthesize unitPrice;
@synthesize userAntiTdr;
@synthesize userBrID;
@synthesize userID;
@synthesize username;

- (void)dealloc
{
	[accountBatchNumber release];
	accountBatchNumber = nil;
	[accountID release];
	accountID = nil;
	[accountType release];
	accountType = nil;
	[brandExchangeCode release];
	brandExchangeCode = nil;
	[brandID release];
	brandID = nil;
	[brandName release];
	brandName = nil;
	[brandProductID release];
	brandProductID = nil;
	[brandServiceID release];
	brandServiceID = nil;
	[brandServiceName release];
	brandServiceName = nil;
	[charge release];
	charge = nil;
	[currency release];
	currency = nil;
	[description release];
	description = nil;
	[destination release];
	destination = nil;
	[errorCode release];
	errorCode = nil;
	[initialBrandBaserate release];
	initialBrandBaserate = nil;
	[localCharge release];
	localCharge = nil;
	[planCharge release];
	planCharge = nil;
	[planDescription release];
	planDescription = nil;
	[planID release];
	planID = nil;
	[productCode release];
	productCode = nil;
	[quantity release];
	quantity = nil;
	[serialNumber release];
	serialNumber = nil;
	[sessionID release];
	sessionID = nil;
	[status release];
	status = nil;
	[time release];
	time = nil;
	[transactionDetailRecordID release];
	transactionDetailRecordID = nil;
	[unitPrice release];
	unitPrice = nil;
	[userAntiTdr release];
	userAntiTdr = nil;
	[userBrID release];
	userBrID = nil;
	[userID release];
	userID = nil;
	[username release];
	username = nil;

	[super dealloc];
}

@end
