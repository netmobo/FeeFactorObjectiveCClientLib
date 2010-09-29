//
//  Users.m
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

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
	User *getUser = [[User alloc] init];
	NSArray *userArray = (NSArray *)[xmlParser fromXml:returnStr withObject:getUser];
	[getUser release];
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
	UserSearchResult *userSearchResult = [[UserSearchResult alloc] init];
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
	UserQuestion *returnQuestion = [[UserQuestion alloc] init];
	NSArray *arr =[[xmlParser fromXml:[transport3 doGet:@"/Users/question" params:questionIdDic] withObject:returnQuestion] objectAtIndex:0];
	returnQuestion = [arr objectAtIndex:0];
	
	return returnQuestion;
}

-(UserQuestionSearchResult *)getUserQuestions:(NSDictionary *)query{
	
	UserQuestionSearchResult *searchResults = [[UserQuestionSearchResult alloc] init];
	UserQuestion *userQusetion = [[UserQuestion alloc] init];
	searchResults.userQuestions = (NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Users/question/search/" params:query] withObject:userQusetion];
	[userQusetion release];
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
	Profile *returnProfile = [[Profile alloc] init];
	returnProfile =(Profile *)[(NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Users/profile/" params:userIdDic] withObject:returnProfile] objectAtIndex:0];
	return returnProfile;
}

-(int)updateUserProfile:(Profile *)userProfile andParams:(NSString *)reason{
	
	NSDictionary *reasonDic = [NSDictionary dictionaryWithObject:reason forKey:@"reason"];
	NSString *updateStr = [xmlParser toXml:userProfile andTag:@"Profile" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPost:@"/Users/profile/" with:updateStr and:reasonDic] intValue];
}								   
								   
//methods introduced on 09/07/2010, user avatar related

-(Image *)getAvatar:(NSNumber *)userID{
	
	NSDictionary *userIdDic = [NSDictionary dictionaryWithObject:[userID stringValue] forKey:@"userID"];
	Image *returnImage = [[Image alloc] init];
	returnImage =(Image *)[(NSArray *)[xmlParser fromXml:[transport3 doGet:@"/Users/profile/avatar" params:userIdDic] withObject:returnImage] objectAtIndex:0];
	return returnImage;

}
-(int)updateAvatar:(NSNumber *)userID andImage:(Image *)image andReason:(NSString *)reason{

	NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc] init];
	
	[paramsDic setValue:[userID stringValue] forKey:@"userID"];
	[paramsDic setValue:reason forKey:@"reason"];
	
	NSString *updateStr = [xmlParser toXml:image andTag:@"Image" inNameSpace:NAME_SPACE_SUBSCRIBER];
	return [[transport3 doPost:@"/Users/profile/avatar" with:updateStr and:paramsDic] intValue];
}
@end
