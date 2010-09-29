//
//  RestTransport3.h
//  FeeFactor
//
//  Created by Netmobo on 15/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"
#import "XmlParser.h"

@interface RestTransport3 : NSObject {
	Config *config;
	XmlParser *xmlParser;
}

@property (nonatomic, retain) XmlParser *xmlParser;
@property (nonatomic, retain) Config *config;


- (NSString *)doGet:(NSString *)serviceName params:(NSDictionary *)params;

- (NSString *)doPost:(NSString *)serviceName with:(NSString *)postContent and:(NSDictionary *)params;
- (NSString *)doPut:(NSString *)serviceName with:(NSString *)putContent and:(NSDictionary *)params;

- (NSString *)doDevicePut:(NSString *)serviceName with:(NSString *)putContent and:(NSDictionary *)params;

-(NSString *)getParamsString:(NSDictionary *)params;

- (int)doDelete:(NSString *)serviceName with:(NSDictionary *)params;

@end
