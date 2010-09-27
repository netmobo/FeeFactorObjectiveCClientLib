//
//  Brands.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
/*
Copyright (c) 2010, NETMOBO LLC
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
Neither the name of NETMOBO LLC nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

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
