//
//  AccountInvoice.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountInvoice : NSObject {
	NSString *  accountID;
    NSNumber * amountDue;
    Boolean archived;
    NSNumber * brandID;
    NSNumber * currentCharges;
    NSString *  dateFrom;
    NSString *  dateTo;
    NSString *  dueDate;
    NSString *  fullyPaid;
    NSString *  fullyPaidDate;
    NSNumber * gmt;
    NSString *  invoiceCode;
    NSString *  invoiceDate;
    NSNumber * invoiceNumber;
    NSString *  preparedBy;
    NSString *  remarks;
    Boolean sentToCustomer;
    NSNumber * userID;
}

@property (nonatomic, copy) NSString *accountID;
@property (nonatomic, retain) NSNumber *amountDue;
@property (nonatomic, assign) Boolean archived;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, retain) NSNumber *currentCharges;
@property (nonatomic, copy) NSString *dateFrom;
@property (nonatomic, copy) NSString *dateTo;
@property (nonatomic, copy) NSString *dueDate;
@property (nonatomic, copy) NSString *fullyPaid;
@property (nonatomic, copy) NSString *fullyPaidDate;
@property (nonatomic, retain) NSNumber *gmt;
@property (nonatomic, copy) NSString *invoiceCode;
@property (nonatomic, copy) NSString *invoiceDate;
@property (nonatomic, retain) NSNumber *invoiceNumber;
@property (nonatomic, copy) NSString *preparedBy;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, assign) Boolean sentToCustomer;
@property (nonatomic, retain) NSNumber *userID;

@end
