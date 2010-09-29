//
//  BrandProductSchedule.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrandProductSchedule : NSObject {
	NSString * dateFrom;
    NSString * dateTo;
    NSString * days;
    NSNumber * productID;
    NSNumber * scheduleID;
    NSNumber * timeFrom;
    NSNumber * timeTo;
}

@property (nonatomic, copy) NSString *dateFrom;
@property (nonatomic, copy) NSString *dateTo;
@property (nonatomic, copy) NSString *days;
@property (nonatomic, retain) NSNumber *productID;
@property (nonatomic, retain) NSNumber *scheduleID;
@property (nonatomic, retain) NSNumber *timeFrom;
@property (nonatomic, retain) NSNumber *timeTo;

@end
