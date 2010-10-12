//
//  Users.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
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

#import "Users.h"

static NSString *NAME_SPACE_SUBSCRIBER = @"http://subscriber.feefactor.com";

@implementation Users

@synthesize xmlParser;
@synthesize transport3;

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

//Error: server error 500
-(User *)getUser:(NSNumber *)userId{
	NSDictionary *userDic = [NSDictionary dictionaryWithObject:[userId stringValue] forKey:@"userID"];
	// NSLog(@"user id is %@",[userId stringValue]);
	NSString *returnStr = [transport3 doGet:@"/Users" params:userDic];
	User *getUser = [[[User alloc] init] autorelease];
	NSArray *userArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getUser];
	if ([userArray count] > 0) {
		
		return [userArray objectAtIndex:0];
	}
	return nil;
}

-(int)updateUser:(User *)user andParams:(NSString *)reason{
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *updateStr = [xmlParser toXml:user andTag:@"User" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[XmlParser getResult:[transport3 doPost:@"/Users" with:updateStr and:reasonDic]] intValue];
}

-(long)insertUser:(User *)user andParams:(NSString *)reason{
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *insertStr = [xmlParser toXml:user andTag:@"User" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPut:@"/Users" with:insertStr and:reasonDic] longLongValue];
}

-(int)deleteUser:(NSNumber *)userId{
	NSDictionary *userDic = [NSDictionary dictionaryWithObject:[userId stringValue] forKey:@"userID"];
	return [transport3 doDelete:@"/Users" with:userDic];
}

//tested ok
-(UserSearchResult *)getUsers:(NSDictionary *)query{
	User *getUser = [[[User alloc] init] autorelease];
	UserSearchResult *userSearchResult = [[[UserSearchResult alloc] init] autorelease];
	userSearchResult.userResults = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"Users/search" params:query] withObject:getUser];
	return userSearchResult;
}

-(long)insertUserQuestion:(UserQuestion *)question withReason:(NSString *)reason{
	
	NSString *userQuestion = [xmlParser toXml:question andTag:@"UserQuestion" inNameSpace:NAME_SPACE_SUBSCRIBER];
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
	return [[transport3 doPut:@"/Users/question" with:userQuestion and:reasonDic] longLongValue];

}

-(UserQuestion *)getUserQuestion:(NSNumber *)userQuestionID{
	
	NSDictionary *questionIdDic = [NSDictionary dictionaryWithObject:[userQuestionID stringValue] forKey:@"userQuestionID"];
	UserQuestion *returnQuestion = [[[UserQuestion alloc] init] autorelease];
	NSArray *arr =[[xmlParser fromXml:[transport3 doGet:@"/Users/question" params:questionIdDic] withObject:returnQuestion] objectAtIndex:0];
	returnQuestion = [arr objectAtIndex:0];
	
	return returnQuestion;
}

-(UserQuestionSearchResult *)getUserQuestions:(NSNumber *)userId andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber{
	
	UserQuestionSearchResult *searchResults = [[[UserQuestionSearchResult alloc] init] autorelease];
	UserQuestion *userQuestion = [[[UserQuestion alloc] init] autorelease];
	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	[paramsDic setValue:userId forKey:@"userID"];
	[paramsDic setValue:where forKey:@"whereCondition"];
	[paramsDic setValue:sort forKey:@"sortString"];
	[paramsDic setValue:[pageItems stringValue] forKey:@"pageItems"];
	[paramsDic setValue:[pageNumber stringValue] forKey:@"pageNumber"];
	searchResults.userQuestions = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Users/question/search/" params:paramsDic] withObject:userQuestion];
	return searchResults;
}


-(long)getUserQuestionsCount:(NSNumber *)userId withCondition:(NSString *)condition{
	
	NSArray *keys = [NSArray arrayWithObjects:@"userID", @"whereCondition", nil];
	NSArray *objects = [NSArray arrayWithObjects:[userId stringValue], condition, nil];
	NSDictionary *paramsDic = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	NSString *resultStri = [transport3 doGet:@"/Users/question/count/" params:paramsDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];

}

-(int)deleteUserQuestion:(NSNumber *)userQuestionID{
	
	NSDictionary *userQuestionDic = [NSDictionary dictionaryWithObject:[userQuestionID stringValue] forKey:@"userQuestionID"];
	return [transport3 doDelete:@"/Users/question" with:userQuestionDic];

}

-(int)updateUserQuestion:(UserQuestion *)userQuestion andParams:(NSString *)reason{
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *updateStr = [xmlParser toXml:userQuestion andTag:@"UserQuestion" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPost:@"/Users/question" with:updateStr and:reasonDic] intValue];
}

-(Profile *)getProfile:(NSNumber *)userID{
	
	NSDictionary *userIdDic = [NSDictionary dictionaryWithObject:[userID stringValue] forKey:@"userID"];
	Profile *returnProfile = [[[Profile alloc] init] autorelease];
	returnProfile =(Profile *)[(NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Users/profile/" params:userIdDic] withObject:returnProfile] objectAtIndex:0];
	return returnProfile;
}

-(int)updateProfile:(Profile *)userProfile andParams:(NSString *)reason{
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *updateStr = [xmlParser toXml:userProfile andTag:@"Profile" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPost:@"/Users/profile/" with:updateStr and:reasonDic] intValue];
}								   
								   
//methods introduced on 09/07/2010, user avatar related

-(Image *)getAvatar:(NSNumber *)userID{
	
	NSDictionary *userIdDic = [NSDictionary dictionaryWithObject:[userID stringValue] forKey:@"userID"];
	Image *returnImage = [[[Image alloc] init] autorelease];
	returnImage =(Image *)[(NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Users/profile/avatar" params:userIdDic] withObject:returnImage] objectAtIndex:0];
	return returnImage;

}
-(int)updateAvatar:(NSNumber *)userID andImage:(Image *)image andReason:(NSString *)reason{

	NSMutableDictionary *paramsDic = [[[NSMutableDictionary alloc] init] autorelease];
	
	[paramsDic setValue:[userID stringValue] forKey:@"userID"];
	[paramsDic setValue:reason forKey:@"reason"];
	
	NSString *updateStr = [xmlParser toXml:image andTag:@"Image" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPost:@"/Users/profile/avatar" with:updateStr and:paramsDic] intValue];
}

-(long)getUsersCount:(NSString *)whereCondition{
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:whereCondition forKey:@"whereCondition"];
	NSString *resultStri = [transport3 doGet:@"/Users/count/" params:reasonDic]; 
	return [[XmlParser getResult:resultStri] longLongValue];
}

@end
