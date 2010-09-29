//
//  UserBankAccount.h
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserBankAccount : NSObject {
	
	@protected
	NSString *accountNumber;
    NSNumber *bankAccountID;
    NSString *bankCode;
    NSString *branchCode;
    NSNumber *brandID;
    NSString *checkDigit;
    NSString *dob;
    NSString *IBanCheckDigits;
    NSString *isoCountryCode;
    NSString *pin;
    NSString *socialSecurityNumber;
    NSString *taxID;
    NSNumber *userID;
    Boolean verified;

}

@property (nonatomic, copy) NSString *accountNumber;
@property (nonatomic, retain) NSNumber *bankAccountID;
@property (nonatomic, copy) NSString *bankCode;
@property (nonatomic, copy) NSString *branchCode;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, copy) NSString *checkDigit;
@property (nonatomic, copy) NSString *dob;
@property (nonatomic, copy) NSString *IBanCheckDigits;
@property (nonatomic, copy) NSString *isoCountryCode;
@property (nonatomic, copy) NSString *pin;
@property (nonatomic, copy) NSString *socialSecurityNumber;
@property (nonatomic, copy) NSString *taxID;
@property (nonatomic, retain) NSNumber *userID;
@property (nonatomic, assign) Boolean verified;

@end
