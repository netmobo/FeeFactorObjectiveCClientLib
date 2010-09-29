//
//  Brands.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Brands.h"
#import "CurrencySearchResult.h"

@implementation Brands

@synthesize transport3;
@synthesize xmlParser;

- (void)dealloc
{
	[transport3 release];
	transport3 = nil;
	[xmlParser release];
	xmlParser = nil;

	[super dealloc];
}

-(id)init{
	[super init];
	transport3 = [[RestTransport3 alloc] init];
	xmlParser = [[XmlParser alloc] init];
	return self;
}

-(ExchangeRate *)getExchangeRate:(NSNumber *)currencyID withID:(NSNumber *)exchangeRateID{

	NSArray *keys = [NSArray arrayWithObjects:@"currencyID", @"exchangeRateID",nil];
	NSArray *objects = [NSArray arrayWithObjects:[currencyID stringValue], [exchangeRateID stringValue],nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	NSString *returnStr = [transport3 doGet:@"/Brands/exchangeRate/rate" params:paramsDic];
	ExchangeRate *getExchangeRate = [[ExchangeRate alloc] init];
	NSArray *exchangeRateArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getExchangeRate];
	[getExchangeRate release];
	if ([exchangeRateArray count] > 0) {
		
		return [exchangeRateArray objectAtIndex:0];
	}
	return nil;
}

-(long)getExchangeRatesCount:(NSNumber *)currencyID withCondition:(NSString *)where{
	
	NSArray *keys = [NSArray arrayWithObjects:@"currencyID", @"whereCondition",nil];
	NSArray *objects = [NSArray arrayWithObjects:[currencyID stringValue],where,nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	NSString *resultStri = [transport3 doGet:@"/Brands/exchangeRate/rate/count" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
	
}

-(CurrencySearchResult *)getCurrencies:(NSNumber *)currencyID withCondition:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	Currency *getCurrency = [[[Currency alloc] init] autorelease];
	CurrencySearchResult *currencySearchResult = [[[CurrencySearchResult alloc] init] autorelease];
	NSArray *keys = [NSArray arrayWithObjects:@"currencyID",@"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
	NSArray *objects = [NSArray arrayWithObjects:[currencyID stringValue],where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	currencySearchResult.results = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/Brands/currency/search/" params:paramsDic] withObject:getCurrency];
	return currencySearchResult;
	
}

-(Brand *)getBrand:(NSNumber *)brandID{
	NSDictionary *brandDic = [NSDictionary dictionaryWithObject:[brandID stringValue] forKey:@"brandID"];
	NSString *returnStr = [transport3 doGet:@"/Brands" params:brandDic];
	Brand *getBrand = [[Brand alloc] init];
	NSArray *brandArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getBrand];
	[getBrand release];
	if ([brandArray count] > 0) {
		
		return [brandArray objectAtIndex:0];
	}
	return nil;
}

-(ExchangeRateSearchResult *)getExchangeRates:(NSNumber *)currencyID withCondition:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	ExchangeRate *getExchangeRate = [[[ExchangeRate alloc] init] autorelease];
	ExchangeRateSearchResult *exchangeRateSearchResult = [[[ExchangeRateSearchResult alloc] init] autorelease];
	NSArray *keys = [NSArray arrayWithObjects:@"currencyID",@"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
	NSArray *objects = [NSArray arrayWithObjects:[currencyID stringValue],where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	exchangeRateSearchResult.exchangeRateResults = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Brands/exchangeRate/rate/search" params:paramsDic] withObject:getExchangeRate];
	return exchangeRateSearchResult;
	
}

-(long)getCurrenciesCount:(NSString *)where{
	
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:where forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Brands/currency/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
	
}


@end
