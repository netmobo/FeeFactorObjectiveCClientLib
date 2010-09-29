//
//  TransactionDetailRecord.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TransactionDetailRecord : NSObject {
	NSNumber * accountBatchNumber;
    NSString * accountID;
    NSString * accountType;
    NSString * brandExchangeCode;
    NSNumber * brandID;
    NSString * brandName;
    NSNumber * brandProductID;
    NSNumber * brandServiceID;
    NSString * brandServiceName;
    NSNumber * charge;
    NSString * currency;
    NSString * description;
    NSString * destination;
    NSString * errorCode;
    NSNumber * initialBrandBaserate;
    NSNumber * localCharge;
    NSNumber * planCharge;
    NSString * planDescription;
    NSNumber * planID;
    NSString * productCode;
    NSNumber * quantity;
    NSNumber * serialNumber;
    NSString * sessionID;
    NSNumber * status;
    NSString * time;
    NSNumber * transactionDetailRecordID;
    NSString * unitPrice;
    NSNumber * userAntiTdr;
    NSNumber * userBrID;
    NSNumber * userID;
    NSString * username;
}

@property (nonatomic, retain) NSNumber *accountBatchNumber;
@property (nonatomic, copy) NSString *accountID;
@property (nonatomic, copy) NSString *accountType;
@property (nonatomic, copy) NSString *brandExchangeCode;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, retain) NSNumber *brandProductID;
@property (nonatomic, retain) NSNumber *brandServiceID;
@property (nonatomic, copy) NSString *brandServiceName;
@property (nonatomic, retain) NSNumber *charge;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *destination;
@property (nonatomic, copy) NSString *errorCode;
@property (nonatomic, retain) NSNumber *initialBrandBaserate;
@property (nonatomic, retain) NSNumber *localCharge;
@property (nonatomic, retain) NSNumber *planCharge;
@property (nonatomic, copy) NSString *planDescription;
@property (nonatomic, retain) NSNumber *planID;
@property (nonatomic, copy) NSString *productCode;
@property (nonatomic, retain) NSNumber *quantity;
@property (nonatomic, retain) NSNumber *serialNumber;
@property (nonatomic, copy) NSString *sessionID;
@property (nonatomic, retain) NSNumber *status;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, retain) NSNumber *transactionDetailRecordID;
@property (nonatomic, copy) NSString *unitPrice;
@property (nonatomic, retain) NSNumber *userAntiTdr;
@property (nonatomic, retain) NSNumber *userBrID;
@property (nonatomic, retain) NSNumber *userID;
@property (nonatomic, copy) NSString *username;

@end
