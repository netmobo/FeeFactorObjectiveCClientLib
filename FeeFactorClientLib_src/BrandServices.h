//
//  BrandServices.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestTransport3.h"
#import "XmlParser.h"
#import "BrandProductSchedule.h"
#import "BrandProductSearchResult.h"
#import "BrandProduct.h"
#import "BrandProductBaserate.h"
#import "BrandServiceSearchResult.h"
#import "BrandProductScheduleSearchResult.h"
#import "BrandProductBaserateSearchResult.h"
#import "BrandService.h"

#import "BrandProductPrice.h"
#import "BrandProductPriceSearchResult.h"
#import "BrandProductPlanPrice.h"
#import "BrandProductPlanPriceSearchResult.h"

@interface BrandServices : NSObject {
	
    @protected
	RestTransport3 *transport3;
	XmlParser *xmlParser;

}

@property (nonatomic, retain) RestTransport3 *transport3;
@property (nonatomic, retain) XmlParser *xmlParser;

-(BrandProductSchedule *)getBrandProductSchedule:(NSNumber *)scheduleID;
-(BrandProductSearchResult *)getBrandProducts:(NSNumber *)serviceID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(BrandProduct *)getBrandProduct:(NSNumber *)productID;
-(long)getBrandProductSchedulesCount:(NSNumber *)productID andCondition:(NSString *)whereCondition;
-(BrandProductBaserate *)getBrandProductBaserate:(NSNumber *)baserateID;
-(long)getBrandProductsCount:(NSNumber *)serviceID andCondition:(NSString *)whereCondition;
-(BrandServiceSearchResult *)getBrandServices:(NSString *)where  andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(BrandProductScheduleSearchResult *)getBrandProductSchedules:(NSNumber *)productID where:(NSString *)where  andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(BrandProductBaserateSearchResult *)getBrandProductBaserates:(NSNumber *)productID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)getBrandServicesCount:(NSString *)where;
-(long)getBrandProductBaseratesCount:(NSNumber *)productID andCondition:(NSString *)whereCondition;
-(BrandService *)getBrandService:(NSNumber *)serviceID;

//changes of 09/07/10
-(BrandProductPrice *)getBrandProductPrice:(NSNumber *)priceID;
-(BrandProductPriceSearchResult *)getBrandProductPrices:(NSNumber *)productID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)getBrandProductPricesCount:(NSNumber *)productID andWhere:(NSString *)where;
-(BrandProductPlanPrice *)getBrandProductPlanPrice:(NSNumber *)priceID;
-(BrandProductPlanPriceSearchResult *)getBrandProductPlanPrices:(NSNumber *)productID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)getBrandProductPlanPricesCount:(NSNumber *)productID andWhere:(NSString *)where;

@end
