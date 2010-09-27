//
//  RestTransport3.m
//  FeeFactor
//
//  Created by Netmobo on 15/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
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
	
	if (error != nil) {
		[self.config setErrorCode:@"error" ];
	} else {
		[self.config setErrorCode:@"none" ];
	}
	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	[protectionSpace release];
	
	
	return [returnString autorelease];
}






- (NSString *)doPost:(NSString *)serviceName with:(NSString *)postContent and:(NSDictionary *)params{
	
	
	NSError *error;
    NSHTTPURLResponse *response;
	
	NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",config.schema,@"://",config.host,@":",config.port,config.serviceUrl,serviceName];
	
	
	NSString *appendingURLString = [self getParamsString:params];
	urlStr = [urlStr stringByAppendingString:appendingURLString];

//	NSLog(@"myRequestString : %@",urlStr); //hdebug
	
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
	
	if (error != nil) {
		[self.config setErrorCode:@"error" ];
	} else {
		[self.config setErrorCode:@"none" ];
	}

	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	
	[returnData release];
	
	
	
//	NSLog(@"[xmlParser getResult:returnString] %@",[XmlParser getResult:returnString]); //hdebug
	
	//return [response statusCode];
	return [returnString autorelease];
}






- (NSString *)doPut:(NSString *)serviceName with:(NSString *)putContent and:(NSDictionary *)params{
	

	NSError *error;
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
	
	if (error != nil) {
		[self.config setErrorCode:@"error" ];
	} else {
		[self.config setErrorCode:@"none" ];
	}
	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
//	NSLog(@"returnString %@",returnString); //hdebug
	
	[returnData release];
	[returnString autorelease];
	return [XmlParser getResult:returnString];
}


- (NSString *)doDevicePut:(NSString *)serviceName with:(NSString *)putContent and:(NSDictionary *)params{
	
	
	NSError *error;
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
	
	if (error != nil) {
		[self.config setErrorCode:@"error" ];
	} else {
		[self.config setErrorCode:@"none" ];
	}
	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
//	NSLog(@"returnString %@",returnString); //hdebug
	
	[returnData release];
	return returnString;
}



- (int)doDelete:(NSString *)serviceName with:(NSDictionary *)params{
	
	
	NSError *error;
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
	
	if (error != nil) {
		[self.config setErrorCode:@"error" ];
	} else {
		[self.config setErrorCode:@"none" ];
	}
	
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
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
