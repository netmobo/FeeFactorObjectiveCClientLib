//
//  UserQuestion.h
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserQuestion : NSObject {
	
	@protected
	NSString *answer;
    NSString *question;
    NSNumber * questionID;
    Boolean requireExactMatch;
    NSNumber * userID;
}

@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *question;
@property (nonatomic, assign) NSNumber * questionID;
@property (nonatomic, assign) Boolean requireExactMatch;
@property (nonatomic, assign) NSNumber * userID;

@end
