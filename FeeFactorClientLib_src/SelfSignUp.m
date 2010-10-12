//
//  SelfSignUp.m
//  FeeFactor
//
//  Created by Netmobo on 15/07/10.
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
	
	User *getUser = [[[User alloc] init] autorelease];
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[questionID stringValue] forKey:@"questionID"];
	[paramsDic setValue:answer forKey:@"answer"];
	NSString *result = [transport3 doPost:@"/signup/Users/question/validate/" with:@"" and:paramsDic];
	User *answerUser = [xmlParser fromXml:result withObject:getUser];
	if (answerUser) {
		return answerUser;
	}
	return nil;
}

-(UserQuestionSearchResult *)getUserQuestions:(NSNumber *)userID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:[userID stringValue] forKey:@"userID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	
	UserQuestionSearchResult *searchResults = [[[UserQuestionSearchResult alloc] init] autorelease];
	UserQuestion *userQuestion = [[[UserQuestion alloc] init] autorelease];
	searchResults.userQuestions = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/signup/Users/question/search/" params:paramsDic] withObject:userQuestion];
	
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
