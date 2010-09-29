//
//  AccountRCSetting.h
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountRCSetting : NSObject {
	
	
@protected 
	
	NSNumber * accountRCID;
    NSString * key;
    NSString * value;
}



@property (nonatomic, assign) NSNumber * accountRCID;
@property (nonatomic, retain) NSString * key;
@property (nonatomic, retain) NSString * value;



@end
