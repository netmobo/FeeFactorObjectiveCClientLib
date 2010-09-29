//
//  ExchangeRate.h
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ExchangeRate : NSObject {
	
	@protected
	NSNumber * currencyID;
    NSString *dateFrom;
    NSString *dateTo;
    NSNumber * exchangeRateID;
    NSNumber * rateVsUSD;

}

@property (nonatomic, assign) NSNumber * currencyID;
@property (nonatomic, copy) NSString *dateFrom;
@property (nonatomic, copy) NSString *dateTo;
@property (nonatomic, assign) NSNumber * exchangeRateID;
@property (nonatomic, assign) NSNumber * rateVsUSD;

@end
