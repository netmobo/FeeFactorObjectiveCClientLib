//
//  UserPaymentAuthorization.h
//  FeeFactor
//
//  Created by Netmobo on 16/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserPaymentAuthorization : NSObject {

	@protected
	NSNumber *balanceLimit;
	NSNumber *brandID;
	NSString *description;
	NSString *expirationDate;
	NSNumber *limitAmount;
	NSString *paymentAuthorizationID;
	NSString *remarks;
	NSString *schedule;
	NSNumber *scheduleAmount;
	NSString *status;
	NSNumber *userID;
}

@property (nonatomic, retain) NSNumber *balanceLimit;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *expirationDate;
@property (nonatomic, retain) NSNumber *limitAmount;
@property (nonatomic, copy) NSString *paymentAuthorizationID;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, copy) NSString *schedule;
@property (nonatomic, retain) NSNumber *scheduleAmount;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, retain) NSNumber *userID;

@end
