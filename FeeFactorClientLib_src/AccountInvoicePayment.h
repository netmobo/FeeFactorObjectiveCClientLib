//
//  AccountInvoicePayment.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountInvoicePayment : NSObject {
	NSNumber * invoiceNumber;
	NSNumber * amount;
	NSNumber * paymentID;
	NSString * paymentDate;
}

@property (nonatomic, retain) NSNumber *invoiceNumber;
@property (nonatomic, retain) NSNumber *amount;
@property (nonatomic, retain) NSNumber *paymentID;
@property (nonatomic, copy) NSString *paymentDate;

@end
