//
//  Invoice.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Invoice.h"


static NSString *NAME_SPACE_SUBSCRIBER = @"http://invoice.feefactor.com";

@implementation Invoice

@synthesize transport3;
@synthesize xmlParser;

- (void)dealloc
{
	[transport3 release];
	transport3 = nil;
	[xmlParser release];
	xmlParser = nil;

	[super dealloc];
}



-(id)init{
	[super init];
	transport3 = [[RestTransport3 alloc] init];
	xmlParser = [[XmlParser alloc] init];
	return self;
}




-(long)getAccountInvoicePaymentsCount:(NSNumber *)invoiceNumber{	
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:[invoiceNumber stringValue] forKey:@"invoiceNumber"];
	NSString *resultStri = [transport3 doGet:@"/Invoices/Account/payment/count/" params:paramsDic]; 
	
	return [resultStri longLongValue];
}





-(UserPayment *)getUserPayment:(NSNumber *)paymentID{
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:[paymentID stringValue] forKey:@"paymentID"];
	NSString *resultStri = [transport3 doGet:@"/Invoices/Users/payment/" params:paramsDic];
	
	UserPayment *userPayment = [[[UserPayment alloc] init] autorelease];
	NSArray *arr = [xmlParser fromXml:resultStri withObject:userPayment];
		
	if ([arr count]) {
		
		return [arr objectAtIndex:0];
	}
	else {
		return nil;
	}

	
}




-(long)insertUserPayment:(UserPayment *) payment reason:(NSString *)reason{
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
    NSString *insertStr = [xmlParser toXml:payment andTag:@"UserPayment" inNameSpace:NAME_SPACE_SUBSCRIBER];
    return [[transport3 doPut:@"/Invoices/Users/payment/" with:insertStr and:reasonDic] longLongValue];  
}




-(AccountInvoice *)getAccountInvoice:(NSNumber *)invoiceNumber{
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:[invoiceNumber stringValue] forKey:@"invoiceNumber"];
	NSString *resultStri = [transport3 doGet:@"/Invoices/Account/" params:paramsDic];
	
	AccountInvoice *accountInvoice = [[[AccountInvoice alloc] init] autorelease];
	
	NSArray *arr = [xmlParser fromXml:resultStri withObject:accountInvoice];
	
	if ([arr count]) {
		
		return [arr objectAtIndex:0];
	}
	else {
		return nil;
	}
	
	
}




-(long)insertAccountBillingRecord:(BillingRecord *)record reason:(NSString *)reason{

	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
    NSString *insertStr = [xmlParser toXml:record andTag:@"BillingRecord" inNameSpace:NAME_SPACE_SUBSCRIBER];
    return [[transport3 doPut:@"/Invoices/Account/billingRecord/" with:insertStr and:reasonDic] longLongValue];  
}




-(long)getAccountInvoicesCount:(NSString *) whereCondition{
	
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Invoices/Account/count/" params:paramsDic]; 
	
	return [resultStri longLongValue];
}




-(long)getUserPaymentsCount:(NSString *) whereCondition{
	
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Invoices/Users/payment/count/" params:paramsDic]; 
	
	return [resultStri longLongValue];

}




-(long)getAccountBillingRecordsCount:(NSNumber *)serialNumber whereCondition:(NSString *)whereCondition{
	
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Invoices/Account/billingRecord/count/" params:paramsDic]; 
	
	return [resultStri longLongValue];

}




-(UserPaymentSearchResult *)getUserPayments:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *)pageNumber{
	UserPayment *userPayment = [[[UserPayment alloc] init] autorelease];
    UserPaymentSearchResult *userPaymentSearchResult = [[[UserPaymentSearchResult alloc] init] autorelease];
    NSArray *keys = [NSArray arrayWithObjects:@"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
    NSArray *objects = [NSArray arrayWithObjects:where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    userPaymentSearchResult.userPayment = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Invoices/Users/payment/search/" params:paramsDic] withObject:userPayment];
    return userPaymentSearchResult;
}




-(AccountInvoicePaymentSearchResult *)getAccountInvoicePayments:(NSNumber *)invoiceNumber{
	
	AccountInvoicePayment *accountInvoicePayment = [[[AccountInvoicePayment alloc] init] autorelease];
    AccountInvoicePaymentSearchResult *accountInvoicePaymentSearchResult = [[[AccountInvoicePaymentSearchResult alloc] init] autorelease];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:[invoiceNumber stringValue] forKey:@"invoiceNumber"];;
    accountInvoicePaymentSearchResult.accountInvoicePayment = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Invoices/Account/payment/" params:paramsDic] withObject:accountInvoicePayment];
    return accountInvoicePaymentSearchResult;

}




-(AccountInvoiceSearchResult *)getAccountInvoices:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *)pageNumber{
	AccountInvoice *accountInvoice = [[[AccountInvoice alloc] init] autorelease];
    AccountInvoiceSearchResult *accountInvoiceSearchResult = [[[AccountInvoiceSearchResult alloc] init] autorelease];
    NSArray *keys = [NSArray arrayWithObjects:@"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
    NSArray *objects = [NSArray arrayWithObjects:where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    accountInvoiceSearchResult.accountInvoice = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Invoices/Account/search/" params:paramsDic] withObject:accountInvoice];
    return accountInvoiceSearchResult;
}




-(BillingRecordSearchResult *)getAccountBillingRecords:(NSNumber *)serialNumber where:(NSString *)where sort:(NSString*)sort pageItems:(NSNumber *)pageItems  pageNumber:(NSNumber *)pageNumber{
	BillingRecord *billingRecord = [[[BillingRecord alloc] init] autorelease];
    BillingRecordSearchResult *billingRecordSearchResult = [[BillingRecordSearchResult alloc] init];
    NSArray *keys = [NSArray arrayWithObjects:@"serialNumber",@"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
    NSArray *objects = [NSArray arrayWithObjects:[serialNumber stringValue],where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    billingRecordSearchResult.billingRecord = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Invoices/Account/billingRecord/search/" params:paramsDic] withObject:billingRecord];
    return billingRecordSearchResult;
	
}




-(AccountInvoicePaymentSearchResult *)generateAccountInvoice:(NSDate *) date brCondition:(NSString *)brCondition serialNumber:(NSNumber *)serialNumber invoiceCode:(NSString *)invoiceCode
										   allowBlankInvoice:(Boolean)allowBlankInvoice reason:(NSString *)reason{
	
	AccountInvoicePayment *accountInvoicePayment = [[[AccountInvoicePayment alloc] init] autorelease];
    AccountInvoicePaymentSearchResult *accountInvoicePaymentSearchResult = [[[AccountInvoicePaymentSearchResult alloc] init] autorelease];
    NSArray *keys = [NSArray arrayWithObjects:@"date", @"brCondition",@"serialNumber",@"invoiceCode",@"allowBlankInvoice",@"reason", nil];
    NSArray *objects = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%f", [date timeIntervalSince1970]],brCondition,[serialNumber stringValue],invoiceCode,allowBlankInvoice,reason,nil];
	
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    accountInvoicePaymentSearchResult.accountInvoicePayment = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Invoices/Account/" params:paramsDic] withObject:accountInvoicePayment];
    return accountInvoicePaymentSearchResult;

}




-(BillingRecord *)  getAccountBillingRecord:(NSNumber *)brID{
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:[brID stringValue] forKey:@"brID"];
	NSString *resultStri = [transport3 doGet:@"/Invoices/Account/billingRecord/" params:paramsDic];
	
	BillingRecord *billingRecord = [[[BillingRecord alloc] init] autorelease];
	
	NSArray *arr = [xmlParser fromXml:resultStri withObject:billingRecord];
	
	if ([arr count]) {
		
		return [arr objectAtIndex:0];
	}
	else {
		return nil;
	}
}




-(int)deleteAccountBillingRecord:(NSNumber *)brID{
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:[brID stringValue] forKey:@"brID"];
    return [transport3 doDelete:@"/Invoices/Account/billingRecord/" with:reasonDic];
}




@end
