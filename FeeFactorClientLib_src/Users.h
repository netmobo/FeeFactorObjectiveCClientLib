//
//  Users.h
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestTransport3.h"
#import "XmlParser.h"
#import "User.h"
#import "UserSearchResult.h"
#import "UserQuestion.h"
#import "UserQuestionSearchResult.h"
#import "Profile.h"
#import "Image.h"


@interface Users : NSObject {
	
    @protected
	RestTransport3 *transport3;
	XmlParser *xmlParser;
	
}

@property (nonatomic, retain) XmlParser *xmlParser;
@property (nonatomic, retain) RestTransport3 *transport3;

-(User *)getUser:(NSNumber *)userId;
-(int)updateUser:(User *)user andParams:(NSString *)reason;
-(long)insertUser:(User *)user andParams:(NSString *)reason;
-(int)deleteUser:(NSNumber *)userId;
-(UserSearchResult *)getUsers:(NSDictionary *)query;
-(long)insertUserQuestion:(UserQuestion *)question withReason:(NSString *)reason;
-(UserQuestion *)getUserQuestion:(NSNumber *)userQuestionID;
-(UserQuestionSearchResult *)getUserQuestions:(NSDictionary *)query;
-(long)getUserQuestionsCount:(NSNumber *)userId withCondition:(NSString *)condition;
-(int)deleteUserQuestion:(NSNumber *)userQuestionID;
-(int)updateUserQuestion:(UserQuestion *)userQuestion andParams:(NSString *)reason;
-(Profile *)getProfile:(NSNumber *)userID;
-(int)updateUserProfile:(Profile *)userProfile andParams:(NSString *)reason;

//methods introduced on 09/07/2010, user avatar related

-(Image *)getAvatar:(NSNumber *)userID;
-(int)updateAvatar:(NSNumber *)userID andImage:(Image *)image andReason:(NSString *)reason;

@end






