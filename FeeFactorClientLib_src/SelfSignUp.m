//
//  SelfSignUp.m
//  FeeFactor
//
//  Created by Netmobo on 15/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SelfSignUp.h"


static NSString *NAME_SPACE_SUBSCRIBER = @"http://subscriber.feefactor.com";

@implementation SelfSignUp

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

-(User *)validateUserQuestion:(NSNumber *)questionID andAnswer:(NSString *)answer{
	
	User *getUser = [[User alloc] init];
	NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc] init];
	[paramsDic setValue:[questionID stringValue] forKey:@"questionID"];
	[paramsDic setValue:answer forKey:@"answer"];
	NSString *result = [transport3 doPost:@"/signup/Users/question/validate/" with:@"" and:paramsDic];
	User *answerUser = [xmlParser fromXml:result withObject:getUser];
	[paramsDic release];
	[getUser release];
	if (answerUser) {
		return answerUser;
	}
	return nil;
}

-(UserQuestionSearchResult *)getUserQuestions:(NSNumber *)userID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc] init];
	[paramsDic setValue:[userID stringValue] forKey:@"userID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	UserQuestionSearchResult *searchResults = [[UserQuestionSearchResult alloc] init];
	UserQuestion *userQusetion = [[UserQuestion alloc] init];
	searchResults.userQuestions = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/signup/Users/question/search/" params:paramsDic] withObject:userQusetion];
	
	[userQusetion release];
	[paramsDic release];
	
	if (searchResults.userQuestions) {
		return searchResults;
	}
	return nil;	
	
}


-(long)getUserQuestionsCount:(NSNumber *)userId withCondition:(NSString *)condition{

	NSArray *keys = [NSArray arrayWithObjects:@"userID", @"whereCondition", nil];
	NSArray *objects = [NSArray arrayWithObjects:[userId stringValue], condition, nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	NSString *resultStri = [transport3 doGet:@"/signup/Users/question/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
}

-(long)insertUser:(User *)user andParams:(NSString *)reason{
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *insertStr = [xmlParser toXml:user andTag:@"User" inNameSpace:NAME_SPACE_SUBSCRIBER];
	
	return [[transport3 doPut:@"/signup/Users" with:insertStr and:reasonDic] longLongValue];
}

@end
