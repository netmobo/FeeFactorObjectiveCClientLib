//
//  XmlParser.m
//  FeeFactor
//
//  Created by Netmobo on 19/05/10.
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
#import "NetmoboFeefactorModel.h"
#import "XmlParser.h"

#import "GDataXMLNode.h"

#import <Foundation/NSObjCRuntime.h>
#import "objc/runtime.h"

#import "TypeMapping.h"
#import "XmlHeaderHelper.h"


@implementation XmlParser

+ (NSMutableDictionary *)propertyDictionary:(NSObject *) obj {
	unsigned int outCount, i;
	
	NSMutableDictionary *dic = [[[NSMutableDictionary alloc] initWithCapacity:1] autorelease];
	
	objc_property_t *properties = class_copyPropertyList([obj class], &outCount);
	for (i = 0; i < outCount; i++) {
		objc_property_t property = properties[i];
		NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
		// propertyType = T@"NSNumber",&,N,VuserID or TC,&,N,VuserID
		NSString *propertyAttribute = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
		
		NSString *propertyType;
		NSRange end = [propertyAttribute rangeOfString:@","];
		if (end.location > 2) {
			propertyType = [propertyAttribute substringWithRange:NSMakeRange(3, end.location - 4)];
		} else {
			propertyType = [propertyAttribute substringWithRange:NSMakeRange(1, end.location - 1)];
		}
		
		[dic setValue:propertyType forKey:propertyName];
	}
	free(properties);
	return dic;
}




+ (NSString *)getResult:(NSString *)xmlString{ 
	NetmoboFeefactorModel *netmoboFeefactorModel = [NetmoboFeefactorModel sharedModel];
	NSString *xmlStr = xmlString;
	
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithXMLString:xmlStr options:0 error:&error] autorelease];
    if (doc == nil) { 
		// NSLog(@"doc doesn't exist");
		return nil; 
	}
	
	
	GDataXMLElement *anElement = [doc rootElement];
	
	//NSLog(@"stringValue :: %@", anElement.stringValue);
//	NSLog(@"getResult: %@", anElement.stringValue);  //debug
	[netmoboFeefactorModel setResultMsg:anElement.stringValue];
	if (anElement) {
		return anElement.stringValue;
	}
	else {
		return @"";
	}
	
}

-(id)fromXml:(NSString *)xmlString withObject:(id)obj{

	NSString *xmlStr = [xmlString stringByReplacingOccurrencesOfString:@"ns1:" withString:@""];
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithXMLString:xmlStr options:0 error:&error] autorelease];
    if (doc == nil) { 
		return nil; 
	}
	
    NSMutableDictionary *propertyDic = [XmlParser propertyDictionary:obj];
	
	const char *objectName = class_getName([obj class]);
	NSString *objectNameStr = [NSString stringWithCString:objectName encoding:NSASCIIStringEncoding];
	NSArray *objects = [[[NSArray alloc] init] autorelease];
	if ([objectNameStr isEqualToString:[[doc rootElement] name]]) {
		objects = [NSArray arrayWithObject:[doc rootElement]];
	} else {
		objects = [doc nodesForXPath:[NSString stringWithFormat:@"//%@", objectNameStr] error:nil];
	}
	
	if (![objects count]) {
		return nil;
	}

	NSMutableArray *returnArray = [[[NSMutableArray alloc] init] autorelease]; 
    for (GDataXMLElement *thisObject in objects) {
		
		NSObject *createdObject = [[NSClassFromString(objectNameStr) alloc] init];
		
  		for (NSString *key in propertyDic) {
			
			NSArray *anArray = [thisObject elementsForName:key];
			if (anArray.count > 0) {
				GDataXMLElement *anElement = (GDataXMLElement *) [anArray objectAtIndex:0];
//				NSLog(@"fromXML: %@", anElement.stringValue);  //debug
				if ([[propertyDic objectForKey:key] isEqualToString:nsNumberType]) {
					NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
					[f setNumberStyle:NSNumberFormatterDecimalStyle];
					[createdObject setValue:[f numberFromString:anElement.stringValue] forKey:key];
					[f release];
					
				} else if([[propertyDic objectForKey:key] isEqualToString:booleanType]){
					[createdObject setValue:[NSNumber numberWithInt:[anElement.stringValue boolValue]] forKey:key];
				} else {
					[createdObject setValue:anElement.stringValue forKey:key];
				}
			}//end if
			
		} //end for
		
		
		[returnArray addObject:createdObject];
		[createdObject release];
	}//end for
	
	return returnArray;
}

-(NSString *)toXml:(id)object andTag:(NSString *)tag inNameSpace:(NSString *)nameSpace{
	
	const char *objectName = class_getName([object class]);
	
	NSString *objectNameStr = [[NSString alloc] initWithBytes:objectName length:strlen(objectName) encoding:NSASCIIStringEncoding];
	
	GDataXMLElement * objectElement = [GDataXMLNode elementWithName:objectNameStr];
	
	[objectElement addNamespace:[GDataXMLNode namespaceWithName:nil stringValue:nameSpace]];
	
    NSMutableDictionary * propertyDic = [XmlParser propertyDictionary:object];
	
	NSString *nodeValue;
	
	for (NSString *key in propertyDic) {

		if ([object valueForKey:key]!=nil){
			
			
			if ([[propertyDic objectForKey:key] isEqualToString:@"l"]) {
				nodeValue = [NSString stringWithFormat:@"%llu",[[object valueForKey:key] unsignedLongLongValue]];
			}else if ([[propertyDic objectForKey:key] isEqualToString:@"i"]) {
				nodeValue = [NSString stringWithFormat:@"%d",[object valueForKey:key]];
			}else {
				nodeValue = [NSString stringWithFormat:@"%@",[object valueForKey:key]];
			}
			
			
			if (nodeValue.length != 0) {
				GDataXMLElement * childElement = [GDataXMLNode elementWithName:key stringValue:nodeValue];
				[objectElement addChild:childElement];
			}
		}
    }
	GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithRootElement:objectElement];
	
	NSData *xmlData = document.XMLData;
	
	NSString *xmlString = [[[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] autorelease];
	
	NSString *bodyString = [xmlString substringFromIndex:21];
	
	NSString *headerString = [XmlHeaderHelper generateXmlHeader:tag and:nameSpace];
	
	xmlString = [NSString stringWithFormat:@"%@%@",headerString,bodyString];
	
//	NSLog(@"to xml: %@",xmlString);  //debug
	
	[objectNameStr release];
	[document release];
	return xmlString;
}




@end
