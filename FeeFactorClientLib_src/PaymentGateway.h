//
//  PaymentGateway.h
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PaymentGateway : NSObject {
	
	@protected
	NSString *authentication;
    NSNumber *brandID;
    NSString *currency;
    NSNumber *groupID;
    NSString *password;
    NSNumber *paymentGatewayID;
    NSString *type;
    NSString *username;

}

@property (nonatomic, copy) NSString *authentication;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, retain) NSNumber *groupID;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, retain) NSNumber *paymentGatewayID;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *username;

@end
