//
//  TransactionDetailRecordSearchResult.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TransactionDetailRecordSearchResult.h"


@implementation TransactionDetailRecordSearchResult

@synthesize transactionDetailRecords;

- (void)dealloc
{
	[transactionDetailRecords release];
	transactionDetailRecords = nil;

	[super dealloc];
}

@end
