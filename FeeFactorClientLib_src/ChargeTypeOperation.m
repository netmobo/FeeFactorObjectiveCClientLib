//
//  ChargeTypeOperation.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ChargeTypeOperation.h"


@implementation ChargeTypeOperation

@synthesize apply;
@synthesize backUpFormula;
@synthesize brandID;
@synthesize brandServiceID;
@synthesize chargeTypeOperationID;
@synthesize chargeTypeOperationName;
@synthesize condition;
@synthesize conditionType;
@synthesize description;
@synthesize formula;
@synthesize formulaType;
@synthesize global;
@synthesize schedule;
@synthesize scheduleType;
@synthesize variables;

- (void)dealloc
{
	[backUpFormula release];
	backUpFormula = nil;
	[brandID release];
	brandID = nil;
	[brandServiceID release];
	brandServiceID = nil;
	[chargeTypeOperationID release];
	chargeTypeOperationID = nil;
	[chargeTypeOperationName release];
	chargeTypeOperationName = nil;
	[condition release];
	condition = nil;
	[conditionType release];
	conditionType = nil;
	[description release];
	description = nil;
	[formula release];
	formula = nil;
	[formulaType release];
	formulaType = nil;
	[schedule release];
	schedule = nil;
	[scheduleType release];
	scheduleType = nil;
	[variables release];
	variables = nil;

	[super dealloc];
}

@end
