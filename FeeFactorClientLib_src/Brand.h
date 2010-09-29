//
//  Brand.h
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Brand : NSObject {
	
	@protected
	Boolean active;
    NSNumber * balance;
    NSString *billingEmailAddress;
    NSString *billingSchedule;
    NSNumber * brandID;
    NSNumber * createdBy;
    NSString *creationDate;
    NSNumber * creditLimit;
    NSNumber * defaultProfileID;
    NSString *domain;
    NSNumber * groupID;
    NSString *name;
    NSNumber * paymentGatewayID;
    NSString *preferences;
    NSNumber * referringAgentID;
    NSString *settings;
    NSString *subscriptionType;
    NSString *timeZone;
    NSString *webUrl;

}

@property (nonatomic, assign) Boolean active;
@property (nonatomic, assign) NSNumber * balance;
@property (nonatomic, copy) NSString *billingEmailAddress;
@property (nonatomic, copy) NSString *billingSchedule;
@property (nonatomic, assign) NSNumber * brandID;
@property (nonatomic, assign) NSNumber * createdBy;
@property (nonatomic, copy) NSString *creationDate;
@property (nonatomic, assign) NSNumber * creditLimit;
@property (nonatomic, assign) NSNumber * defaultProfileID;
@property (nonatomic, copy) NSString *domain;
@property (nonatomic, assign) NSNumber * groupID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSNumber * paymentGatewayID;
@property (nonatomic, copy) NSString *preferences;
@property (nonatomic, assign) NSNumber * referringAgentID;
@property (nonatomic, copy) NSString *settings;
@property (nonatomic, copy) NSString *subscriptionType;
@property (nonatomic, copy) NSString *timeZone;
@property (nonatomic, copy) NSString *webUrl;

@end
