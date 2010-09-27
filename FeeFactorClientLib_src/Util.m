//
//  Util.m
//  FeeFactor
//
//  Created by Netmobo on 30/05/10.
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

#import "Util.h"

#import <Foundation/NSObjCRuntime.h>
#import "objc/runtime.h"



static const char* getPropertyType(objc_property_t property) {
	
    // parse the property attribues. this is a comma delimited string. the type of the attribute starts with the
	
    // character 'T' should really just use strsep for this, using a C99 variable sized array.
	
    const char *attributes = property_getAttributes(property);
	char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
	
    char *state = buffer;
	char *attribute;
	
	
	
    while ((attribute = strsep(&state, ",")) != NULL) {
		
        if (attribute[0] == 'T' && strlen(attribute)>2) {
			
            // return a pointer scoped to the autorelease pool. Under GC, this will be a separate block.
			
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute)-4] bytes];
			
			
			
        }else if (attribute[0] == 'T' && strlen(attribute)==2) {
			return (const char *)[[NSData dataWithBytes:(attribute + 1) length:strlen(attribute)] bytes];
		}
		
    }
	
    return "@";
	
}


@implementation Util


+ (NSMutableDictionary *)propertyDictionary:(NSObject *) objt{
    unsigned int outCount, i;
	
	NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:1]; 
    objc_property_t *properties = class_copyPropertyList([objt class], &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
			const char *propType = getPropertyType(property);
			NSString *propertyName = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
			
			
			fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
			NSString *propertyType = [NSString stringWithCString:propType encoding:NSUTF8StringEncoding];
			
			
			[dic setValue:propertyType forKey:propertyName];
        }
    }
	
	
    free(properties);
	
	return dic;
}




+ (NSMutableDictionary *)propertyWithValueDictionary:(NSObject *) objt{
    unsigned int outCount, i;
	
	NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:1]; 
    objc_property_t *properties = class_copyPropertyList([objt class], &outCount);
	
	 NSString *nalue = @"";
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
			const char *propType = getPropertyType(property);
			
			NSString *propertyType = [NSString stringWithCString:propType encoding:NSUTF8StringEncoding];
			NSString *propertyName = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
			
			
			
			if ([objt valueForKey:propertyName] == nil) {
				nalue = @"";
			}
			else if ([propertyType isEqualToString:@"l"]) {
				nalue = [NSString stringWithFormat:@"%llu",[[objt valueForKey:propertyName] unsignedLongLongValue]];
			}else if ([propertyType isEqualToString:@"i"]) {
				nalue = [NSString stringWithFormat:@"%d",[objt valueForKey:propertyName]];
			}else {
				nalue = [NSString stringWithFormat:@"%@",[objt valueForKey:propertyName]];
			}
			
			[dic setObject:nalue forKey:propertyName];

        }
    }
	
	
    free(properties);
	
	return dic;
}




+ (NSString *)urlEncodeValue:(NSString *)unencodedString
{
    NSString * encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes(
																				   NULL,
																				   (CFStringRef)unencodedString,
																				   NULL,
																				   (CFStringRef)@"!*'();:@&=+$,/?%#[]",
																				   kCFStringEncodingUTF8 );
	
	return [encodedString autorelease];
}





@end
