//
//  Users.h
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
-(UserQuestionSearchResult *)getUserQuestions:(NSNumber *)userId andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)getUserQuestionsCount:(NSNumber *)userId withCondition:(NSString *)condition;
-(int)deleteUserQuestion:(NSNumber *)userQuestionID;
-(int)updateUserQuestion:(UserQuestion *)userQuestion andParams:(NSString *)reason;
-(Profile *)getProfile:(NSNumber *)userID;
-(int)updateProfile:(Profile *)userProfile andParams:(NSString *)reason;

//methods introduced on 09/07/2010, user avatar related

-(Image *)getAvatar:(NSNumber *)userID;
-(int)updateAvatar:(NSNumber *)userID andImage:(Image *)image andReason:(NSString *)reason;

-(long)getUsersCount:(NSString *)whereCondition;

@end






