//
//  Config.h
//  FeeFactor
//
//  Created by Netmobo on 15/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Config : NSObject {
	NSString *schema;
	NSString *host;
	NSString *port;
	NSString *serviceUrl;
	NSString *userName;
	NSString *passWord;
	NSString *encode;
	NSString *realm;
	NSString *errorCode;
}




@property (nonatomic, retain) NSString *schema;
@property (nonatomic, retain) NSString *host;
@property (nonatomic, retain) NSString *port;
@property (nonatomic, retain) NSString *serviceUrl;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *passWord;
@property (nonatomic, retain) NSString *encode;
@property (nonatomic, retain) NSString *realm;
@property (nonatomic, retain) NSString *errorCode;


+ (id) defaultConfig;


@end

