//
//  Invoice.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestTransport3.h"
#import "XmlParser.h"

#import "UserPayment.h"
#import "AccountInvoice.h"

#import "BillingRecord.h"

#import "UserPaymentSearchResult.h"
#import "AccountInvoicePaymentSearchResult.h"

#import "BillingRecordSearchResult.h"

#import "AccountInvoiceSearchResult.h"

#import "AccountInvoicePayment.h"




@interface Invoice : NSObject {
	RestTransport3 *transport3;
	XmlParser *xmlParser;
}

@property (nonatomic, retain) RestTransport3 *transport3;
@property (nonatomic, retain) XmlParser *xmlParser;


-(long)getAccountInvoicePaymentsCount:(NSNumber *)invoiceNumber;
-(UserPayment *)getUserPayment:(NSNumber *)paymentID;
-(long)insertUserPayment:(UserPayment *) payment reason:(NSString *)reason;
-(AccountInvoice *)getAccountInvoice:(NSNumber *)invoiceNumber;
-(long)insertAccountBillingRecord:(BillingRecord *)record reason:(NSString *)reason;
-(long)getAccountInvoicesCount:(NSString *) whereCondition;
-(long)getUserPaymentsCount:(NSString *) whereCondition;
-(long)getAccountBillingRecordsCount:(NSNumber *)serialNumber whereCondition:(NSString *)whereCondition;
-(UserPaymentSearchResult *)getUserPayments:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *)pageNumber;
-(AccountInvoicePaymentSearchResult *)getAccountInvoicePayments:(NSNumber *)invoiceNumber;
-(AccountInvoiceSearchResult *)getAccountInvoices:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *)pageNumber;
-(BillingRecordSearchResult *)getAccountBillingRecords:(NSNumber *)serialNumber where:(NSString *)where sort:(NSString*)sort pageItems:(NSNumber *)pageItems  pageNumber:(NSNumber *)pageNumber;
-(AccountInvoicePaymentSearchResult *)generateAccountInvoice:(NSDate *) date brCondition:(NSString *)brCondition serialNumber:(NSNumber *)serialNumber invoiceCode:(NSString *)invoiceCode
										   allowBlankInvoice:(Boolean)allowBlankInvoice reason:(NSString *)reason;
-(BillingRecord *)  getAccountBillingRecord:(NSNumber *)brID;
-(int)deleteAccountBillingRecord:(NSNumber *)brID;



@end
