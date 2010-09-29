//
//  Account.m
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Account.h"


@implementation Account

@synthesize accountID;
@synthesize accountPlanID;
@synthesize activationDate;
@synthesize autoActivate;
@synthesize balance;
@synthesize batchNumber;
@synthesize brandID;
@synthesize brandServiceID;
@synthesize creationDate;
@synthesize creator;
@synthesize creditLimit;
@synthesize currencyID;
@synthesize denomination;
@synthesize endRoamDate;
@synthesize expirationDate;
@synthesize firstUseDate;
@synthesize freeRollOverBal;
@synthesize freeValueBal;
@synthesize inactiveAgeLimit;
@synthesize inactiveExpirationDate;
@synthesize initialBalance;
@synthesize lastPlanRefreshDate;
@synthesize lastUseDate;
@synthesize planID;
@synthesize remarks;
@synthesize roaming;
@synthesize serialNumber;
@synthesize settings;
@synthesize simultaneousAccess;
@synthesize status;
@synthesize type;
@synthesize usageAge;
@synthesize usageDate;
@synthesize usageExpirationDate;
@synthesize userID;


- (void)dealloc
{
	[accountID release];

	[activationDate release];

	[creationDate release];
	[creator release];

	[endRoamDate release];
	[expirationDate release];
	[firstUseDate release];


	[inactiveExpirationDate release];

	[lastPlanRefreshDate release];
	[lastUseDate release];

	[remarks release];

	[settings release];

	[status release];
	[type release];

	[usageDate release];
	[usageExpirationDate release];
	
	[super dealloc];

}



@end
