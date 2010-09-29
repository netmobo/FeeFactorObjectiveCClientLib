//
//  RestTransport3.m
//  FeeFactor
//
//  Created by Netmobo on 15/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RestTransport3.h"
#import "Config.h"
#import "GDataXMLNode.h"

#import "Util.h"

@implementation RestTransport3

@synthesize xmlParser;
@synthesize config;




- (void)dealloc
{
	[config release];
	[xmlParser release];
	xmlParser = nil;

	[super dealloc];
}





- (id) init{
	
	[super init];
	config = [Config defaultConfig];
	return self;
}





- (NSString *)doGet:(NSString *)serviceName params:(NSDictionary *)params{
	
	NSError *error = nil;
    NSURLResponse *response;
	
	
	NSString *myRequestString = [NSString stringWithFormat:@"%@://%@%@%@%@%@",config.schema,config.host,@":",config.port,config.serviceUrl,serviceName];
	
	
	
	NSString *appendingURLString = [self getParamsString:params];
	myRequestString = [myRequestString stringByAppendingString:appendingURLString];
	
//	NSLog(@"myRequestString : %@",myRequestString); //hdebug
	
	
	
	NSURLCredential *credential = [NSURLCredential credentialWithUser:config.userName
															 password:config.passWord
														  persistence:NSURLCredentialPersistenceForSession];
	
	
	
	NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc]
											 initWithHost:config.host
											 port:[config.port intValue]
											 protocol:config.schema
											 realm:config.realm
											 authenticationMethod:nil];
	
	
	[[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:credential forProtectionSpace:protectionSpace];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:myRequestString]];
	
	
	NSData *returnData = [[ NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error ] mutableCopy];
	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	if (error == nil) {
		[self.config setErrorCode:@"none" ];
	} else {
		[self.config setErrorCode:[XmlParser getResult:returnString] ];
		NSLog(@"result/error: %@", [XmlParser getResult:returnString]);
	}
	
	
	[protectionSpace release];
	
	
	return [returnString autorelease];
}






- (NSString *)doPost:(NSString *)serviceName with:(NSString *)postContent and:(NSDictionary *)params{
	
	
	NSError *error = nil;
    NSHTTPURLResponse *response;
	
	NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",config.schema,@"://",config.host,@":",config.port,config.serviceUrl,serviceName];
	
	
	NSString *appendingURLString = [self getParamsString:params];
	urlStr = [urlStr stringByAppendingString:appendingURLString];
	
	NSURLCredential *credential = [NSURLCredential credentialWithUser:config.userName
															 password:config.passWord
														  persistence:NSURLCredentialPersistenceForSession];
	
	NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc]
											 initWithHost:config.host
											 port:[config.port intValue]
											 protocol:config.schema
											 realm:config.realm
											 authenticationMethod:nil];
	
	
	[[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:credential forProtectionSpace:protectionSpace];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
	
	[request setHTTPMethod:@"POST"];

	if (postContent) {
		NSData *bodyData = [postContent dataUsingEncoding:NSUTF8StringEncoding];
		
		
		[request setHTTPBody:bodyData];
	}
	
	NSData *returnData = [[ NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error ] mutableCopy];
	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	if (error == nil) {
		[self.config setErrorCode:@"none" ];
	} else {
		[self.config setErrorCode:[XmlParser getResult:returnString] ];
		NSLog(@"result/error: %@", [XmlParser getResult:returnString]);
	}
	
	
	[returnData release];
	
	
	
//	NSLog(@"[xmlParser getResult:returnString] %@",[XmlParser getResult:returnString]); //hdebug
	
	//return [response statusCode];
	return [returnString autorelease];
}






- (NSString *)doPut:(NSString *)serviceName with:(NSString *)putContent and:(NSDictionary *)params{
	
	
	NSError *error = nil;
    NSHTTPURLResponse *response;
	
	NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",config.schema,@"://",config.host,@":",config.port,config.serviceUrl,serviceName];
	
	NSString *appendingURLString = [self getParamsString:params];
	urlStr = [urlStr stringByAppendingString:appendingURLString];
	
	NSURLCredential *credential = [NSURLCredential credentialWithUser:config.userName
															 password:config.passWord
														  persistence:NSURLCredentialPersistenceForSession];
	
	NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc]
											 initWithHost:config.host
											 port:[config.port intValue]
											 protocol:config.schema
											 realm:config.realm
											 authenticationMethod:nil];
	
	
	[[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:credential forProtectionSpace:protectionSpace];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
	
	[request setHTTPMethod:@"PUT"];
	for (NSString *key in params) {
		//NSLog(@"%@ 's content is:: %@",key,[params valueForKey:key]);
		[request addValue:[params valueForKey:key] forHTTPHeaderField:key];
	}
	
	[request setValue:@"application/xml" forHTTPHeaderField:@"Content-type"];
	
	NSData *bodyData = [putContent dataUsingEncoding:NSUTF8StringEncoding];
	
	[request setHTTPBody:bodyData];
	
	NSData *returnData = [[ NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error ] mutableCopy];
	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	if (error == nil) {
		[self.config setErrorCode:@"none" ];
	} else {
		[self.config setErrorCode:[XmlParser getResult:returnString] ];
		NSLog(@"result/error: %@", [XmlParser getResult:returnString]);
	}
	
	
	[returnData release];
	[returnString autorelease];
	return [XmlParser getResult:returnString];
}


- (NSString *)doDevicePut:(NSString *)serviceName with:(NSString *)putContent and:(NSDictionary *)params{
	
	
	NSError *error = nil;
    NSHTTPURLResponse *response;
	
	NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",config.schema,@"://",config.host,@":",config.port,config.serviceUrl,serviceName];
	
	
	NSURLCredential *credential = [NSURLCredential credentialWithUser:config.userName
															 password:config.passWord
														  persistence:NSURLCredentialPersistenceForSession];
	
	NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc]
											 initWithHost:config.host
											 port:[config.port intValue]
											 protocol:config.schema
											 realm:config.realm
											 authenticationMethod:nil];
	
	
	[[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:credential forProtectionSpace:protectionSpace];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
	
	[request setHTTPMethod:@"PUT"];
	for (NSString *key in params) {
		//NSLog(@"%@ 's content is:: %@",key,[params valueForKey:key]);
		[request addValue:[params valueForKey:key] forHTTPHeaderField:key];
	}
	
	[request setValue:@"application/xml" forHTTPHeaderField:@"Content-type"];
	
	NSData *bodyData = [putContent dataUsingEncoding:NSUTF8StringEncoding];
	
	[request setHTTPBody:bodyData];
	
	NSData *returnData = [[ NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error ] mutableCopy];
	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	if (error == nil) {
		[self.config setErrorCode:[XmlParser getResult:returnString] ];
		NSLog(@"result/error: %@", [XmlParser getResult:returnString]);
	} else {
		[self.config setErrorCode:@"none" ];
	}
	
	
//	NSLog(@"returnString %@",returnString); //hdebug
	
	[returnData release];
	return returnString;
}



- (int)doDelete:(NSString *)serviceName with:(NSDictionary *)params{
	
	
	NSError *error = nil;
    NSHTTPURLResponse *response;
	
	NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",config.schema,@"://",config.host,@":",config.port,config.serviceUrl,serviceName,[self getParamsString:params]];
	
	
//	NSLog(@"urlStr %@", urlStr); //hdebug
	
	NSURLCredential *credential = [NSURLCredential credentialWithUser:config.userName
															 password:config.passWord
														  persistence:NSURLCredentialPersistenceForSession];
	
	NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc]
											 initWithHost:config.host
											 port:[config.port intValue]
											 protocol:config.schema
											 realm:config.realm
											 authenticationMethod:nil];
	
	
	[[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:credential forProtectionSpace:protectionSpace];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
	
	[request setHTTPMethod:@"DELETE"];
	
	NSData *returnData = [[ NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error ] mutableCopy];
	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	if (error == nil) {
		[self.config setErrorCode:[XmlParser getResult:returnString] ];
		NSLog(@"result/error: %@", [XmlParser getResult:returnString]);
	} else {
		[self.config setErrorCode:@"none" ];
	}
	
//	NSLog(@"returnString %@",returnString); //hdebug
	
	[returnString autorelease];
	
	return [[XmlParser getResult:returnString] intValue];
}





-(NSString *)getParamsString:(NSDictionary *)params{
	
	NSString *returnString = @"?";
	
	int ind = 1;
	
	for (id key in params) {
		if (ind < [params count]) {
			returnString = [returnString stringByAppendingFormat:@"%@=%@&", key, [Util urlEncodeValue:[params objectForKey:key]]];
		}
		else {
			returnString = [returnString stringByAppendingFormat:@"%@=%@", key,[Util urlEncodeValue:[params objectForKey:key]]];
		}
		
		
		ind++;
		
	}
	//NSLog(@"returnString :%@", returnString);
	
	return returnString;
	
}


@end
