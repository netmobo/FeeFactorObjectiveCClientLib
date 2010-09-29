//
//  TransactionDetailRecords.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TransactionDetailRecords.h"


@implementation TransactionDetailRecords

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





-(TransactionDetailRecord *)getTransactionDetailRecord:(NSNumber *)transactionDetailRecordID{
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:[transactionDetailRecordID stringValue] forKey:@"transactionDetailRecordID"];
	NSString *resultStri = [transport3 doGet:@"/Transactions" params:paramsDic];
	
	TransactionDetailRecord *transactionDetailRecord = [[[TransactionDetailRecord alloc] init] autorelease];
	
	NSArray *arr = [xmlParser fromXml:resultStri withObject:transactionDetailRecord];
	
	if ([arr count]) {
		
		return [arr objectAtIndex:0];
	}
	else {
		return nil;
	}
}





-(TransactionDetailRecord *)getSwitchLog:(NSNumber *)transactionDetailRecordID{
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:[transactionDetailRecordID stringValue] forKey:@"transactionDetailRecordID"];
	NSString *resultStri = [transport3 doGet:@"/Transactions/SwitchLogs/" params:paramsDic];
	
	TransactionDetailRecord *transactionDetailRecord = [[[TransactionDetailRecord alloc] init] autorelease];
	
	NSArray *arr = [xmlParser fromXml:resultStri withObject:transactionDetailRecord];
	
	if ([arr count]) {
		
		return [arr objectAtIndex:0];
	}
	else {
		return nil;
	}
}




-(TransactionDetailRecordSearchResult *)getSwitchLogs:(NSNumber *) brandID accountID:(NSString *)accountID where:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *) pageNumber{
	TransactionDetailRecord *transactionDetailRecord = [[[TransactionDetailRecord alloc] init] autorelease];
    TransactionDetailRecordSearchResult *transactionDetailRecordSearchResult = [[[TransactionDetailRecordSearchResult alloc] init] autorelease];
    
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"accountID",@"whereCondition",@"sortString", @"pageItems", @"pageNumber",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],accountID,where,sort,[pageItems stringValue], [pageNumber stringValue],nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	
	
    transactionDetailRecordSearchResult.transactionDetailRecords = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Transactions/SwitchLogs/search/" params:paramsDic] withObject:transactionDetailRecord];
    return transactionDetailRecordSearchResult;
}




-(TransactionDetailRecordSearchResult *)getRawSwitchLogs:(NSNumber *) brandID accountID:(NSString *)accountID where:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *) pageNumber{
	TransactionDetailRecord *transactionDetailRecord = [[TransactionDetailRecord alloc] init];
    TransactionDetailRecordSearchResult *transactionDetailRecordSearchResult = [[TransactionDetailRecordSearchResult alloc] init];
    
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"accountID",@"whereCondition",@"sortString", @"pageItems", @"pageNumber",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],accountID,where,sort,[pageItems stringValue], [pageNumber stringValue],nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	
	
    transactionDetailRecordSearchResult.transactionDetailRecords = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Transactions/Raw/search/" params:paramsDic] withObject:transactionDetailRecord];
	[transactionDetailRecord release];
	
    return transactionDetailRecordSearchResult;
}




-(TransactionDetailRecordSearchResult *)getTransactionDetailRecords:(NSNumber *) brandID accountID:(NSString *)accountID where:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *) pageNumber{
	TransactionDetailRecord *transactionDetailRecord = [[[TransactionDetailRecord alloc] init] autorelease];
    TransactionDetailRecordSearchResult *transactionDetailRecordSearchResult = [[[TransactionDetailRecordSearchResult alloc] init] autorelease];
    
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"accountID",@"whereCondition",@"sortString", @"pageItems", @"pageNumber",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],accountID,where,sort,[pageItems stringValue], [pageNumber stringValue],nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	
	
    transactionDetailRecordSearchResult.transactionDetailRecords = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Transactions/search/" params:paramsDic] withObject:transactionDetailRecord];
    return transactionDetailRecordSearchResult;
}




-(long)getRawSwitchLogsCount:(NSNumber *) brandID accountID:(NSString *)accountID whereCondition:(NSString *)whereCondition{
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"accountID", @"whereCondition",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],accountID,whereCondition,nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	NSString *resultStri = [transport3 doGet:@"/Transactions/Raw/count/" params:paramsDic]; 
	
	return [resultStri longLongValue];

}




-(long)getTransactionDetailRecordsCount:(NSNumber *) brandID accountID:(NSString *)accountID whereCondition:(NSString *)whereCondition{
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"accountID", @"whereCondition",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],accountID,whereCondition,nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	NSString *resultStri = [transport3 doGet:@"/Transactions/count/" params:paramsDic]; 
	
	return [resultStri longLongValue];

}




-(long)getSwitchLogsCount:(NSNumber *) brandID accountID:(NSString *)accountID whereCondition:(NSString *)whereCondition{
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"accountID", @"whereCondition",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],accountID,whereCondition,nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	NSString *resultStri = [transport3 doGet:@"/Transactions/SwitchLogs/count/" params:paramsDic]; 
	
	return [resultStri longLongValue];

}




-(NSString *)chargeAccount:(NSNumber *) brandID accountID:(NSString *)accountID serviceName:(NSString *)serviceName productCode:(NSString *)productCode quantity:(NSNumber *)quantity  reason:(NSString *)reason{
	
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"accountID", @"serviceName",@"product",@"quantity",@"reason",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],accountID,serviceName,productCode,[quantity stringValue],reason,nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	
	NSString *ret = [transport3 doPost:@"/Transactions/single/account/" with:nil and:paramsDic];
	
	return [XmlParser getResult:ret];
	
}





-(NSString *)chargeUser:(NSNumber *) brandID username:(NSString *)username password:(NSString *)password serviceName:(NSString *)serviceName productCode:(NSString *)productCode quantity:(NSNumber *)quantity  reason:(NSString *)reason{
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"username",@"password", @"serviceName",@"product",@"quantity",@"reason",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],username,password,serviceName,productCode,[quantity stringValue],reason,nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	
	NSString *ret = [transport3 doPost:@"/Transactions/single/user/" with:nil and:paramsDic];
	
	return [XmlParser getResult:ret];
}





-(NSString *)startChargingAccount:(NSNumber *) brandID accountID:(NSString *)accountID serviceName:(NSString *)serviceName productCode:(NSString *)productCode quantity:(NSNumber *)quantity  reason:(NSString *)reason{
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"accountID", @"serviceName",@"product",@"quantity",@"reason",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],accountID,serviceName,productCode,[quantity stringValue],reason,nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	
	NSString *ret = [transport3 doPost:@"/Transactions/start/account/" with:nil and:paramsDic];
	
	return [XmlParser getResult:ret];

}





-(NSString *)startChargeUser:(NSNumber *) brandID username:(NSString *)username password:(NSString *)password serviceName:(NSString *)serviceName productCode:(NSString *)productCode quantity:(NSNumber *)quantity  reason:(NSString *)reason{
	NSArray *keys = [NSArray arrayWithObjects:@"brandID", @"username",@"password", @"serviceName",@"product",@"quantity",@"reason",nil];
    NSArray *objects = [NSArray arrayWithObjects:[brandID stringValue],username,password,serviceName,productCode,[quantity stringValue],reason,nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	
	NSString *ret = [transport3 doPost:@"/Transactions/start/user/" with:nil and:paramsDic];
	
	return [XmlParser getResult:ret];
}





-(Boolean)checkIfRunning:(NSString *)sessionID{
	//NSArray *keys = [NSArray arrayWithObjects:@"sessionID", @"reason",nil];
//    NSArray *objects = [NSArray arrayWithObjects:sessionID,reason, nil];
//    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
//	
//	
//	NSString *ret = [transport3 doPut:@"/Transactions/end/" with:nil and:paramsDic];
//	
//	return [XmlParser getResult:ret];
	
	return YES;
}





-(NSString *)endCharging:(NSString *)sessionID reason:(NSString *)reason{
	
	NSArray *keys = [NSArray arrayWithObjects:@"sessionID", @"reason",nil];
    NSArray *objects = [NSArray arrayWithObjects:sessionID,reason, nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	
	return [transport3 doPut:@"/Transactions/end/" with:nil and:paramsDic];
}





-(NSString *)reverseTransactionDetailRecord:(NSNumber *)transactionDetailRecordID reason:(NSString *)reason{
	NSArray *keys = [NSArray arrayWithObjects:@"transactionDetailRecordID", @"reason",nil];
    NSArray *objects = [NSArray arrayWithObjects:[transactionDetailRecordID stringValue],reason, nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	// NSLog(@"[transactionDetailRecordID stringValue] :: %@", [transactionDetailRecordID stringValue]);
	
	NSString *ret = [transport3 doPost:@"/Transactions/reverse/" with:nil and:paramsDic];
	
	return [XmlParser getResult:ret];
}





-(NSString *)adjustTransactionDetailRecord:(NSNumber *)transactionDetailRecordID newQuantity:(NSNumber *)newQuantity newCharge:(NSNumber *)newCharge reason:(NSString *)reason{
	
	NSArray *keys = [NSArray arrayWithObjects:@"transactionDetailRecordID",@"newQuantity", @"newCharge", @"reason",nil];
    NSArray *objects = [NSArray arrayWithObjects:[transactionDetailRecordID stringValue],[newQuantity stringValue],[newCharge stringValue], reason, nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	NSString *ret = [transport3 doPost:@"/Transactions/adjust/" with:nil and:paramsDic];
	
	return [XmlParser getResult:ret];
}




@end
