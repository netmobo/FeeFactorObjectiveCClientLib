//
//  Plans.m
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 Netmobo. All rights reserved.
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
    PlanSearchResult *planSearchResult = [[[PlanSearchResult alloc] init] autorelease];
    NSArray *keys = [NSArray arrayWithObjects:@"whereCondition", @"sortString",@"pageItems",@"pageNumber",nil];
    NSArray *objects = [NSArray arrayWithObjects:where,sort,[pageItems stringValue],[pageNumber stringValue],nil];
    NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	planSearchResult.plans = [NSMutableArray arrayWithArray:[xmlParser fromXml:[transport3 doGet:@"/Plans/search/" params:paramsDic] withObject:plan]];
//    planSearchResult.plans = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Plans/search/" params:paramsDic] withObject:plan];
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
