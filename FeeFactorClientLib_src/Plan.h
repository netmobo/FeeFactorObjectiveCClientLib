//
//  Plan.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Plan : NSObject {
	NSNumber * brandID;
    NSNumber * currencyID;
    NSString * description;
    NSNumber * freeValue;
    NSNumber * planCharge;
    NSNumber * planID;
    NSNumber * planType;
    NSNumber * rollOverMode;
    NSNumber * rollOverValue;
    NSString * settings;
}

@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, retain) NSNumber *currencyID;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, retain) NSNumber *freeValue;
@property (nonatomic, retain) NSNumber *planCharge;
@property (nonatomic, retain) NSNumber *planID;
@property (nonatomic, retain) NSNumber *planType;
@property (nonatomic, retain) NSNumber *rollOverMode;
@property (nonatomic, retain) NSNumber *rollOverValue;
@property (nonatomic, copy) NSString *settings;

@end
