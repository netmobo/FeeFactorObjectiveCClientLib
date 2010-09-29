//
//  AccountPlan.h
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountPlan : NSObject {
	
@protected 
	NSNumber * accountPlanID;
	NSNumber * amount;
    NSString *description;
    NSString *effectivityDate;
    NSString *endDate;
    NSNumber * planID;
    NSNumber * serialNumber;
}


@property (nonatomic, assign) NSNumber * accountPlanID;
@property (nonatomic, assign) NSNumber * amount;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *effectivityDate;
@property (nonatomic, retain) NSString *endDate;
@property (nonatomic, assign) NSNumber * planID;
@property (nonatomic, assign) NSNumber * serialNumber;

@end
