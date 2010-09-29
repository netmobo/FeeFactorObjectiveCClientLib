//
//  UserPayment.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserPayment : NSObject {
	NSNumber * amount;
    NSNumber * amountTaken;
    NSNumber * brandID;
    NSString * description;
    NSString * paymentDate;
    NSNumber * paymentID;
    NSString * paymentType;
    NSString * preparedBy;
    NSString * referenceID;
    NSString * remarks;
    NSNumber * userID;
}

@property (nonatomic, retain) NSNumber *amount;
@property (nonatomic, retain) NSNumber *amountTaken;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *paymentDate;
@property (nonatomic, retain) NSNumber *paymentID;
@property (nonatomic, copy) NSString *paymentType;
@property (nonatomic, copy) NSString *preparedBy;
@property (nonatomic, copy) NSString *referenceID;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, retain) NSNumber *userID;

@end
