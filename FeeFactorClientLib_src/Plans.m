//
//  Plans.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Plans.h"

//static NSString *NAME_SPACE_SUBSCRIBER = @"http://accounts.feefactor.com";


@implementation Plans

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

-(PlanRC *)getPlanRC:(NSNumber *)planRcID{

	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:[planRcID stringValue] forKey:@"planRcID"];
	NSString *resultStri = [transport3 doGet:@"/Plans/recurringCharges/" params:paramsDic];
	
	PlanRC *planRC = [[[PlanRC alloc] init] autorelease];
	
	NSArray *arr = [xmlParser fromXml:resultStri withObject:planRC];
	
	if ([arr count]) {
		
		return [arr objectAtIndex:0];
	}
	else {
		return nil;
	}
}





-(Plan *)getPlan:(NSNumber *)planID{

	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:[planID stringValue] forKey:@"planID"];
	NSString *resultStri = [transport3 doGet:@"/Plans" params:paramsDic];
	
	Plan *plan = [[[Plan alloc] init] autorelease];
	NSArray *arr = [xmlParser fromXml:resultStri withObject:plan];
	
	if ([arr count]) {
		
		return [arr objectAtIndex:0];
	}
	else {
		return nil;
	}

}





-(PlanSearchResult *)getPlans:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *)pageNumber{
	Plan *plan = [[[Plan alloc] init] autorelease];
    PlanSearchResult *planSearchResult = [[PlanSearchResult alloc] init] ;
    NSArray *keys = [NSArray arrayWithObjects:@"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
    NSArray *objects = [NSArray arrayWithObjects:where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    planSearchResult.plans = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Plans/search/" params:paramsDic] withObject:plan];
    return planSearchResult;


}





-(long)getPlanRCsCount:(NSNumber *)planID  whereCondition:(NSString *) whereCondition{
	NSArray *keys = [NSArray arrayWithObjects:@"planID", @"whereCondition",nil];
    NSArray *objects = [NSArray arrayWithObjects:[planID stringValue],whereCondition,nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];	
	
	NSString *resultStri = [transport3 doGet:@"/Plans/recurringCharges/count/" params:paramsDic]; 
	
	return [resultStri longLongValue];
}





-(long)getPlansCount:(NSString *) whereCondition{

	NSDictionary *paramsDic = [NSDictionary dictionaryWithObject:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Plans/count/" params:paramsDic]; 
	
	return [resultStri longLongValue];

}





-(PlanRCSearchResult *)getPlanRCs:(NSNumber *)planID where:(NSString *)where sort:(NSString *)sort pageItems:(NSNumber *)pageItems pageNumber:(NSNumber *)pageNumber{
	PlanRC *planRC = [[[PlanRC alloc] init] autorelease];
    PlanRCSearchResult *planRCSearchResult = [[[PlanRCSearchResult alloc] init] autorelease];
    NSArray *keys = [NSArray arrayWithObjects:@"planID", @"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
    NSArray *objects = [NSArray arrayWithObjects:[planID stringValue], where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    planRCSearchResult.planRC = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Plans/recurringCharges/search/" params:paramsDic] withObject:planRC];
    return planRCSearchResult;
}

@end
