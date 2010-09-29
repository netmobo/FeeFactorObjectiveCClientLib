//
//  Brands.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestTransport3.h"
#import "XmlParser.h"
#import "ExchangeRate.h"
#import "Currency.h"
#import "Brand.h"
#import "ExchangeRateSearchResult.h"

@class CurrencySearchResult;

@interface Brands : NSObject {

    @protected
	RestTransport3 *transport3;
	XmlParser *xmlParser;
	
}

@property (nonatomic, retain) RestTransport3 *transport3;
@property (nonatomic, retain) XmlParser *xmlParser;

-(ExchangeRate *)getExchangeRate:(NSNumber *)currencyID withID:(NSNumber *)exchangeRateID;
-(long)getExchangeRatesCount:(NSNumber *)currencyID withCondition:(NSString *)where;
-(CurrencySearchResult *)getCurrencies:(NSNumber *)currencyID withCondition:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(Brand *)getBrand:(NSNumber *)brandID;
-(ExchangeRateSearchResult *)getExchangeRates:(NSNumber *)currencyID withCondition:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)getCurrenciesCount:(NSString *)where;

@end
