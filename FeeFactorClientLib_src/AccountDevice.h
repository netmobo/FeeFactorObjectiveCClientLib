//
//  AccountDevice.h
//  FeeFactor
//
//  Created by Netmobo on 1/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountDevice : NSObject {
	
	NSString *accountid;
	NSNumber *brandserviceid;
	NSString *deviceID;

}

@property (nonatomic, retain) NSString *accountid;
@property (nonatomic, retain) NSNumber *brandserviceid;
@property (nonatomic, retain) NSString *deviceID;

@end
