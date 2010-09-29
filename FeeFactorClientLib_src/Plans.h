//
//  Plans.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "RestTransport3.h"
#import "XmlParser.h"
#import "PlanRC.h"
#import "Plan.h"
#import "PlanSearchResult.h"
#import "PlanRCSearchResult.h"


@interface Plans : NSObject {
	
	RestTransport3 *transport3;
	XmlParser *xmlParser;
}

@property (nonatomic, retain) RestTransport3 *transport3;
@property (nonatomic, retain) XmlParser *xmlParser;

-(PlanRC *)getPlanRC:(NSNumber *)planRcID;
-(Plan *)getPlan:(NSNumber *)planID;
-(PlanSearchResult *)getPlans:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *)pageNumber;
-(long)getPlanRCsCount:(NSNumber *)planID  whereCondition:(NSString *) whereCondition;
-(long)getPlansCount:(NSString *) whereCondition;
-(PlanRCSearchResult *)getPlanRCs:(NSNumber *)planID where:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *)pageNumber;

@end
