//
//  TransactionDetailRecords.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransactionDetailRecord.h"
#import "TransactionDetailRecordSearchResult.h"
#import "RestTransport3.h"
#import "XmlParser.h"


@interface TransactionDetailRecords : NSObject {
	
	RestTransport3 *transport3;
	XmlParser *xmlParser;
}

@property (nonatomic, retain) RestTransport3 *transport3;
@property (nonatomic, retain) XmlParser *xmlParser;


-(TransactionDetailRecord *)getTransactionDetailRecord:(NSNumber *)transactionDetailRecordID;
-(TransactionDetailRecord *)getSwitchLog:(NSNumber *)transactionDetailRecordID;
-(TransactionDetailRecordSearchResult *)getSwitchLogs:(NSNumber *) brandID accountID:(NSString *)accountID where:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *) pageNumber;
-(TransactionDetailRecordSearchResult *)getRawSwitchLogs:(NSNumber *) brandID accountID:(NSString *)accountID where:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *) pageNumber;
-(TransactionDetailRecordSearchResult *)getTransactionDetailRecords:(NSNumber *) brandID accountID:(NSString *)accountID where:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *) pageNumber;
-(long)getRawSwitchLogsCount:(NSNumber *) brandID accountID:(NSString *)accountID whereCondition:(NSString *)whereCondition;
-(long)getTransactionDetailRecordsCount:(NSNumber *) brandID accountID:(NSString *)accountID whereCondition:(NSString *)whereCondition;
-(long)getSwitchLogsCount:(NSNumber *) brandID accountID:(NSString *)accountID whereCondition:(NSString *)whereCondition;
-(NSString *)chargeAccount:(NSNumber *) brandID accountID:(NSString *)accountID serviceName:(NSString *)serviceName productCode:(NSString *)productCode quantity:(NSNumber *)quantity  reason:(NSString *)reason;
-(NSString *)chargeUser:(NSNumber *) brandID username:(NSString *)username password:(NSString *)password serviceName:(NSString *)serviceName productCode:(NSString *)productCode quantity:(NSNumber *)quantity  reason:(NSString *)reason;
-(NSString *)startChargingAccount:(NSNumber *) brandID accountID:(NSString *)accountID serviceName:(NSString *)serviceName productCode:(NSString *)productCode quantity:(NSNumber *)quantity  reason:(NSString *)reason;
-(NSString *)startChargeUser:(NSNumber *) brandID username:(NSString *)username password:(NSString *)password serviceName:(NSString *)serviceName productCode:(NSString *)productCode quantity:(NSNumber *)quantity  reason:(NSString *)reason;
-(Boolean)checkIfRunning:(NSString *)sessionID;
-(NSString *)endCharging:(NSString *)sessionID reason:(NSString *)reason;
-(NSString *)reverseTransactionDetailRecord:(NSNumber *)transactionDetailRecordID reason:(NSString *)reason;
-(NSString *)adjustTransactionDetailRecord:(NSNumber *)transactionDetailRecordID newQuantity:(NSNumber *)newQuantity newCharge:(NSNumber *)newCharge reason:(NSString *)reason;


@end
