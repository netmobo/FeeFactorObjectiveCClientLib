//
//  UserCard.h
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserCard : NSObject {
	
	@protected
	NSString *address1;
    NSString *address2;
    NSNumber *brandID;
    NSNumber *cardID;
    NSString *cardNumber;
    NSString *city;
    NSString *country;
    NSString *currency;
    NSString *emailAddress;
    NSString *expiryMonth;
    NSString *expiryYear;
    NSString *firstName;
    NSString *issuer;
    NSString *lastName;
    NSString *middleInitial;
    NSString *phoneNumber;
    NSString *remarks;
    NSString *state;
    NSNumber *userID;
    NSString *zipcode;

}

@property (nonatomic, copy) NSString *address1;
@property (nonatomic, copy) NSString *address2;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, retain) NSNumber *cardID;
@property (nonatomic, copy) NSString *cardNumber;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *emailAddress;
@property (nonatomic, copy) NSString *expiryMonth;
@property (nonatomic, copy) NSString *expiryYear;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *issuer;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *middleInitial;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, retain) NSNumber *userID;
@property (nonatomic, copy) NSString *zipcode;

@end
