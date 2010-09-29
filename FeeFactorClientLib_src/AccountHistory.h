//
//  AccountHistory.h
//  Netmobo
//
//  Created by Netmobo on 26/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountHistory : NSObject {
	
	NSNumber *accountHistoryID;
	NSNumber *adminID;
	NSNumber *amountChange;
	NSString *description;
	NSNumber *previousBalance;
	NSString *referenceID;
	NSNumber *serialNumber;
	NSString *transactionDate;
	NSString *transactionType;

}

@property (nonatomic, retain) NSNumber *accountHistoryID;
@property (nonatomic, retain) NSNumber *adminID;
@property (nonatomic, retain) NSNumber *amountChange;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, retain) NSNumber *previousBalance;
@property (nonatomic, copy) NSString *referenceID;
@property (nonatomic, retain) NSNumber *serialNumber;
@property (nonatomic, copy) NSString *transactionDate;
@property (nonatomic, copy) NSString *transactionType;

@end
