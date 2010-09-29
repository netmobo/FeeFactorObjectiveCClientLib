//
//  TransactionDetailRecordSearchResult.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TransactionDetailRecordSearchResult : NSObject {
	NSArray *transactionDetailRecords;
}

@property (nonatomic, copy) NSArray *transactionDetailRecords;

@end
