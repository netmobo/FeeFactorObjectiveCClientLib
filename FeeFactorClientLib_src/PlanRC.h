//
//  PlanRC.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PlanRC : NSObject {
	NSNumber * amount;
    NSString * description;
    NSNumber * planID;
    NSNumber * planRcID;
}

@property (nonatomic, retain) NSNumber *amount;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, retain) NSNumber *planID;
@property (nonatomic, retain) NSNumber *planRcID;

@end
