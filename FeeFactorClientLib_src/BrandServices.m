//
//  BrandServices.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BrandServices.h"


@implementation BrandServices

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

-(BrandProductSchedule *)getBrandProductSchedule:(NSNumber *)scheduleID{
	
	NSMutableDictionary *brandDic = [NSMutableDictionary dictionaryWithObject:[scheduleID stringValue] forKey:@"scheduleID"];
	NSString *returnStr = [transport3 doGet:@"/Services/Brand/product/schedule/" params:brandDic];
	BrandProductSchedule *getBrandProductSchedule = [[BrandProductSchedule alloc] init];
	NSArray *brandProductScheduleArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getBrandProductSchedule];
	[getBrandProductSchedule release];
	if ([brandProductScheduleArray count] > 0) {
		
		return [brandProductScheduleArray objectAtIndex:0];
	}
	return nil;

}

-(BrandProductSearchResult *)getBrandProducts:(NSNumber *)serviceID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	
	[paramsDic setValue:[serviceID stringValue] forKey:@"serviceID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	BrandProduct *getBrandProduct = [[[BrandProduct alloc] init] autorelease];
	
	BrandProductSearchResult *getBrandProductSearchResult= [[[BrandProductSearchResult alloc] init] autorelease];
	getBrandProductSearchResult.brandProducts = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/Services/Brand/product/search/" params:paramsDic] withObject:getBrandProduct];
	return getBrandProductSearchResult;
	
}

-(BrandProduct *)getBrandProduct:(NSNumber *)productID{
	
	NSMutableDictionary *brandDic = [NSMutableDictionary dictionaryWithObject:[productID stringValue] forKey:@"productID"];
	NSString *returnStr = [transport3 doGet:@"/Services/Brand/product/" params:brandDic];
	BrandProduct *getBrandProduct = [[BrandProduct alloc] init];
	NSArray *brandProductArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getBrandProduct];
	[getBrandProduct release];
	if ([brandProductArray count] > 0) {
		
		return [brandProductArray objectAtIndex:0];
	}
	return nil;
}

-(long)getBrandProductSchedulesCount:(NSNumber *)productID andCondition:(NSString *)whereCondition{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[productID stringValue] forKey:@"productID"];
	[paramsDic setValue:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Services/Brand/product/schedule/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
}

-(BrandProductBaserate *)getBrandProductBaserate:(NSNumber *)baserateID{

	NSMutableDictionary *brandDic = [NSMutableDictionary dictionaryWithObject:[baserateID stringValue] forKey:@"baserateID"];
	NSString *returnStr = [transport3 doGet:@"/Services/Brand/product/" params:brandDic];
	BrandProductBaserate *getBrandProductBaserate = [[BrandProductBaserate alloc] init];
	NSArray *brandProductBaserateArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getBrandProductBaserate];
	[getBrandProductBaserate release];
	if ([brandProductBaserateArray count] > 0) {
		
		return [brandProductBaserateArray objectAtIndex:0];
	}
	return nil;
}

-(long)getBrandProductsCount:(NSNumber *)serviceID andCondition:(NSString *)whereCondition{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[serviceID stringValue] forKey:@"productID"];
	[paramsDic setValue:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Services/Brand/product/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
}

-(BrandServiceSearchResult *)getBrandServices:(NSString *)where  andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	BrandService *getBrandService= [[[BrandService alloc] init] autorelease];
	
	BrandServiceSearchResult *getBrandServiceSearchResult= [[[BrandServiceSearchResult alloc] init] autorelease];
	getBrandServiceSearchResult.brandServices = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/Services/Brand/search/" params:paramsDic] withObject:getBrandService];
	return getBrandServiceSearchResult;

}

-(BrandProductScheduleSearchResult *)getBrandProductSchedules:(NSNumber *)productID where:(NSString *)where  andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	
	[paramsDic setValue:[productID stringValue] forKey:@"productID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	BrandProductSchedule *getBrandProductSchedule= [[[BrandProductSchedule alloc] init] autorelease];
	
	BrandProductScheduleSearchResult *getBrandProductScheduleSearchResult= [[[BrandProductScheduleSearchResult alloc] init] autorelease];
	getBrandProductScheduleSearchResult.brandProductSchedules = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/Services/Brand/product/schedule/search/" params:paramsDic] withObject:getBrandProductSchedule];
	return getBrandProductScheduleSearchResult;
	
}

-(BrandProductBaserateSearchResult *)getBrandProductBaserates:(NSNumber *)productID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{

	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	
	[paramsDic setValue:[productID stringValue] forKey:@"productID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	BrandProductBaserate *getBrandProductBaserate = [[[BrandProductBaserate alloc] init] autorelease];
	
	BrandProductBaserateSearchResult *getBrandProductBaserateSearchResult= [[[BrandProductBaserateSearchResult alloc] init] autorelease];
	getBrandProductBaserateSearchResult.brandProductBaserates = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/Services/Brand/product/rates/search/" params:paramsDic] withObject:getBrandProductBaserate];
	return getBrandProductBaserateSearchResult;
	
}

-(long)getBrandServicesCount:(NSString *)where{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:where forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Services/Brand/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
	
}

-(long)getBrandProductBaseratesCount:(NSNumber *)productID andCondition:(NSString *)whereCondition{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[productID stringValue] forKey:@"productID"];
	[paramsDic setValue:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Services/Brand/product/rates/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
}

-(BrandService *)getBrandService:(NSNumber *)serviceID{
	
	NSMutableDictionary *brandDic = [NSMutableDictionary dictionaryWithObject:[serviceID stringValue] forKey:@"serviceID"];
	NSString *returnStr = [transport3 doGet:@"/Services/Brand" params:brandDic];
	BrandService *getBrandService = [[BrandService alloc] init];
	NSArray *brandServiceArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getBrandService];
	[getBrandService release];
	if ([brandServiceArray count] > 0) {
		
		return [brandServiceArray objectAtIndex:0];
	}
	return nil;
	
}


-(BrandProductPrice *)getBrandProductPrice:(NSNumber *)priceID{

	NSMutableDictionary *paramsdic = [NSMutableDictionary dictionaryWithObject:[priceID stringValue] forKey:@"priceID"];
	NSString *returnStr = [transport3 doGet:@"/Services/Brand/product/prices/" params:paramsdic];
	BrandProductPrice *getBrandProductPrice = [[BrandProductPrice alloc] init];
	NSArray *brandProductpriceArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getBrandProductPrice];
	[getBrandProductPrice release];
	if ([brandProductpriceArray count] > 0) {
		
		return [brandProductpriceArray objectAtIndex:0];
	}
	return nil;
}
-(BrandProductPriceSearchResult *)getBrandProductPrices:(NSNumber *)productID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{

	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	
	[paramsDic setValue:[productID stringValue] forKey:@"productID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	BrandProductPrice *getBrandProductPrice = [[BrandProductPrice alloc] init];
	
	BrandProductPriceSearchResult *getBrandProductPriceSearchResult= [[BrandProductPriceSearchResult alloc] init];
	getBrandProductPriceSearchResult.results = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/Services/Brand/product/prices/search/" params:paramsDic] withObject:getBrandProductPrice];
	return getBrandProductPriceSearchResult;
}

-(long)getBrandProductPricesCount:(NSNumber *)productID andWhere:(NSString *)where{

	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:productID forKey:@"productID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Services/Brand/product/prices/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
}

-(BrandProductPlanPrice *)getBrandProductPlanPrice:(NSNumber *)priceID{

	NSMutableDictionary *paramsdic = [NSMutableDictionary dictionaryWithObject:[priceID stringValue] forKey:@"priceID"];
	NSString *returnStr = [transport3 doGet:@"/Services/Brand/product/prices/plan/" params:paramsdic];
	BrandProductPlanPrice *getBrandProductPlanPrice = [[BrandProductPlanPrice alloc] init];
	NSArray *brandProductPlanPriceArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getBrandProductPlanPrice];
	[getBrandProductPlanPrice release];
	if ([brandProductPlanPriceArray count] > 0) {
		
		return [brandProductPlanPriceArray objectAtIndex:0];
	}
	return nil;
}

-(BrandProductPlanPriceSearchResult *)getBrandProductPlanPrices:(NSNumber *)productID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{

	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	
	[paramsDic setValue:[productID stringValue] forKey:@"productID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	BrandProductPlanPrice *getBrandProductPlanPrice = [[BrandProductPlanPrice alloc] init];
	
	BrandProductPlanPriceSearchResult *getBrandProductPlanPriceSearchResult= [[BrandProductPlanPriceSearchResult alloc] init];
	getBrandProductPlanPriceSearchResult.results = (NSMutableArray *)[xmlParser fromXml:[transport3 doGet:@"/Services/Brand/product/prices/plan/search/" params:paramsDic] withObject:getBrandProductPlanPrice];
	return getBrandProductPlanPriceSearchResult;
}
-(long)getBrandProductPlanPricesCount:(NSNumber *)productID andWhere:(NSString *)where{

	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:productID forKey:@"productID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Services/Brand/product/prices/plan/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
}

@end
