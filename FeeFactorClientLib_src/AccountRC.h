//
//  AccountRC.h
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountRC : NSObject {

	
@protected
	NSString * accountID;
	NSNumber * accountRCID;
	NSNumber * amount;
	NSNumber * brandID;
	NSString * createdBy;
	NSString * creationDate;
	NSString * cronExpression;
	NSString * description;
	NSString * effectivityDate;
	NSString * endDate;
	NSString * nextAppTime;
	NSString * prevAppTime;
	NSNumber * priority;
	NSNumber * serialNumber;
	NSString * status;
}



@property (nonatomic, retain) NSString * accountID;
@property (nonatomic, assign) NSNumber * accountRCID;
@property (nonatomic, assign) NSNumber * amount;
@property (nonatomic, assign) NSNumber * brandID;
@property (nonatomic, retain) NSString * createdBy;
@property (nonatomic, retain) NSString * creationDate;
@property (nonatomic, retain) NSString * cronExpression;
@property (nonatomic, retain) NSString * description;
@property (nonatomic, retain) NSString * effectivityDate;
@property (nonatomic, retain) NSString * endDate;
@property (nonatomic, retain) NSString * nextAppTime;
@property (nonatomic, retain) NSString * prevAppTime;
@property (nonatomic, assign) NSNumber * priority;
@property (nonatomic, assign) NSNumber * serialNumber;
@property (nonatomic, retain) NSString * status;

@end
