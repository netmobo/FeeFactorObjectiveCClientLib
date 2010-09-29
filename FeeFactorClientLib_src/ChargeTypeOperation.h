//
//  ChargeTypeOperation.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ChargeTypeOperation : NSObject {
	Boolean apply;
    NSString *  backUpFormula;
	NSNumber * brandID;
	NSNumber * brandServiceID;
	NSNumber * chargeTypeOperationID;
    NSString *  chargeTypeOperationName;
    NSString *  condition;
	NSNumber * conditionType;
    NSString *  description;
    NSString *  formula;
	NSNumber * formulaType;
    Boolean global;
    NSString *  schedule;
	NSNumber * scheduleType;
    NSString *  variables;
}

@property (nonatomic, assign) Boolean apply;
@property (nonatomic, copy) NSString *backUpFormula;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, retain) NSNumber *brandServiceID;
@property (nonatomic, retain) NSNumber *chargeTypeOperationID;
@property (nonatomic, copy) NSString *chargeTypeOperationName;
@property (nonatomic, copy) NSString *condition;
@property (nonatomic, retain) NSNumber *conditionType;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *formula;
@property (nonatomic, retain) NSNumber *formulaType;
@property (nonatomic, assign) Boolean global;
@property (nonatomic, copy) NSString *schedule;
@property (nonatomic, retain) NSNumber *scheduleType;
@property (nonatomic, copy) NSString *variables;

@end
