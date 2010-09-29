//
//  Account.h
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Account : NSObject {
	
	
@protected	
	NSString *accountID;
	NSNumber * accountPlanID;
	NSString *activationDate;
	Boolean autoActivate;
	NSNumber * balance;
	NSNumber * batchNumber;
	NSNumber * brandID;
	NSNumber * brandServiceID;
	NSString *creationDate;
	NSString *creator;
	NSNumber * creditLimit;
	NSNumber * currencyID;
	NSNumber * denomination;
	NSString *endRoamDate;
	NSString *expirationDate;
	NSString *firstUseDate;
	NSNumber * freeRollOverBal;
	NSNumber * freeValueBal;
	NSNumber * inactiveAgeLimit;
	NSString *inactiveExpirationDate;
	NSNumber * initialBalance;
	NSString *lastPlanRefreshDate;
	NSString *lastUseDate;
	NSNumber * planID;
	NSString *remarks;
	Boolean roaming;
	NSNumber * serialNumber;
	NSString *settings;
	NSNumber * simultaneousAccess;
	NSString *status;
	NSString *type;
	NSNumber * usageAge;
	NSString *usageDate;
	NSString *usageExpirationDate;
	NSNumber * userID;
}

@property (nonatomic, retain) NSString *accountID;
@property (nonatomic, retain) NSNumber * accountPlanID;
@property (nonatomic, retain) NSString *activationDate;
@property (nonatomic, assign) Boolean autoActivate;
@property (nonatomic, retain) NSNumber * balance;
@property (nonatomic, retain) NSNumber * batchNumber;
@property (nonatomic, retain) NSNumber * brandID;
@property (nonatomic, retain) NSNumber * brandServiceID;
@property (nonatomic, retain) NSString *creationDate;
@property (nonatomic, retain) NSString *creator;
@property (nonatomic, retain) NSNumber * creditLimit;
@property (nonatomic, retain) NSNumber * currencyID;
@property (nonatomic, retain) NSNumber * denomination;
@property (nonatomic, retain) NSString *endRoamDate;
@property (nonatomic, retain) NSString *expirationDate;
@property (nonatomic, retain) NSString *firstUseDate;
@property (nonatomic, retain) NSNumber * freeRollOverBal;
@property (nonatomic, retain) NSNumber * freeValueBal;
@property (nonatomic, retain) NSNumber * inactiveAgeLimit;
@property (nonatomic, retain) NSString *inactiveExpirationDate;
@property (nonatomic, retain) NSNumber * initialBalance;
@property (nonatomic, retain) NSString *lastPlanRefreshDate;
@property (nonatomic, retain) NSString *lastUseDate;
@property (nonatomic, retain) NSNumber * planID;
@property (nonatomic, retain) NSString *remarks;
@property (nonatomic, assign) Boolean roaming;
@property (nonatomic, retain) NSNumber * serialNumber;
@property (nonatomic, retain) NSString *settings;
@property (nonatomic, retain) NSNumber * simultaneousAccess;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSNumber * usageAge;
@property (nonatomic, retain) NSString *usageDate;
@property (nonatomic, retain) NSString *usageExpirationDate;
@property (nonatomic, retain) NSNumber * userID;

@end
