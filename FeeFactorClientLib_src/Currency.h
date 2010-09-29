//
//  Currency.h
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Currency : NSObject {
	
	@protected
	NSNumber * brandID;
    NSString *currencyCode;
    NSNumber * currencyID;
    NSString *description;
    NSString *lastUpdateTime;
    Boolean updateDaily;

}

@property (nonatomic, assign) NSNumber * brandID;
@property (nonatomic, copy) NSString *currencyCode;
@property (nonatomic, assign) NSNumber * currencyID;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *lastUpdateTime;
@property (nonatomic, assign) Boolean updateDaily;

@end
