//
//  BillingRecord.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BillingRecord : NSObject {
	NSString * accountID;
    NSNumber * accountOwnerID;
    NSNumber * amount;
    Boolean archived;
    NSNumber * billingRecordID;
    NSNumber * brType;
    NSNumber * brandID;
    NSString * dateFrom;
    NSString * dateTo;
    NSString * description;
    NSNumber * groupID;
    NSNumber * invoiceNumber;
    NSNumber * productID;
    NSNumber * quantity;
    NSString * remarks;
    NSNumber * transactionCount;
    NSString * unit;
    NSString * unitPrice;
    NSNumber * userID;
}

@property (nonatomic, copy) NSString *accountID;
@property (nonatomic, retain) NSNumber *accountOwnerID;
@property (nonatomic, retain) NSNumber *amount;
@property (nonatomic, assign) Boolean archived;
@property (nonatomic, retain) NSNumber *billingRecordID;
@property (nonatomic, retain) NSNumber *brType;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, copy) NSString *dateFrom;
@property (nonatomic, copy) NSString *dateTo;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, retain) NSNumber *groupID;
@property (nonatomic, retain) NSNumber *invoiceNumber;
@property (nonatomic, retain) NSNumber *productID;
@property (nonatomic, retain) NSNumber *quantity;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, retain) NSNumber *transactionCount;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSString *unitPrice;
@property (nonatomic, retain) NSNumber *userID;

@end
