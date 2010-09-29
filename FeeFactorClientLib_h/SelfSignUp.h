//
//  SelfSignUp.h
//  FeeFactor
//
//  Created by Netmobo on 15/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserQuestionSearchResult.h"
#import "UserQuestion.h"
#import "RestTransport3.h"
#import "XmlParser.h"

@interface SelfSignUp : NSObject {

    @protected
	RestTransport3 *transport3;
	XmlParser *xmlParser;
}

@property (nonatomic, retain) RestTransport3 *transport3;
@property (nonatomic, retain) XmlParser *xmlParser;

-(User *)validateUserQuestion:(NSNumber *)questionID andAnswer:(NSString *)answer;
-(UserQuestionSearchResult *)getUserQuestions:(NSNumber *)userID andWhere:(NSString *)where andSort:(NSString *)sort andPageItems:(NSNumber *)pageItems andPageNumber:(NSNumber *)pageNumber;
-(long)getUserQuestionsCount:(NSNumber *)userId withCondition:(NSString *)condition;
-(long)insertUser:(User *)user andParams:(NSString *)reason;

@end
