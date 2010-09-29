//
//  AccountRCActivityLog.h
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountRCActivityLog : NSObject {
	
@protected
	
	NSString * accountID;
	NSNumber * accountRCActivityLogID;
	NSNumber * accountRCID;
    NSString * activity;
	NSNumber * adminID;
    NSString * adminName;
	NSNumber * amount;
	NSNumber * brandID;
    NSString * ip;
	NSNumber * recAccountRCALID;
    NSString * remarks;
    NSString * schedule;
	NSNumber * serialNumber;
    NSString * timestamp;
    NSString * type;
}


@property (nonatomic, retain) NSString * accountID;
@property (nonatomic, assign) NSNumber * accountRCActivityLogID;
@property (nonatomic, assign) NSNumber * accountRCID;
@property (nonatomic, retain) NSString * activity;
@property (nonatomic, assign) NSNumber * adminID;
@property (nonatomic, retain) NSString * adminName;
@property (nonatomic, assign) NSNumber * amount;
@property (nonatomic, assign) NSNumber * brandID;
@property (nonatomic, retain) NSString * ip;
@property (nonatomic, assign) NSNumber * recAccountRCALID;
@property (nonatomic, retain) NSString * remarks;
@property (nonatomic, retain) NSString * schedule;
@property (nonatomic, assign) NSNumber * serialNumber;
@property (nonatomic, retain) NSString * timestamp;
@property (nonatomic, retain) NSString * type;

@end
