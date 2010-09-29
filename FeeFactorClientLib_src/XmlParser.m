//
//  XmlParser.m
//  FeeFactor
//
//  Created by Netmobo on 19/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "XmlParser.h"

#import "GDataXMLNode.h"

#import <Foundation/NSObjCRuntime.h>
#import "objc/runtime.h"

#import "TypeMapping.h"
#import "XmlHeaderHelper.h"



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


@implementation XmlParser



+ (NSMutableDictionary *)propertDictionary:(NSObject *) objt{
    unsigned int outCount, i;
	
	NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:1]; 
    objc_property_t *properties = class_copyPropertyList([objt class], &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
			const char *propType = getPropertyType(property);
			NSString *propertyName = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
			//propertyName = [propertyName stringByReplacingOccurrencesOfString:@"@\"NSString\"" withString:@""];		
			//NSLog(@"propName :: %@",propertyName);
			NSString *propertyType = [NSString stringWithCString:propType encoding:NSUTF8StringEncoding];
			
			//NSLog(@"propertyType :: %@",propertyType);
			
			[dic setValue:propertyType forKey:propertyName];
        }
    }
	
	
    free(properties);
	
	return dic;
	
}




+ (NSString *)getResult:(NSString *)xmlString{ 
	
	NSString *xmlStr = xmlString;
	
	//xmlStr = [xmlStr stringByReplacingOccurrencesOfString:@"ns1:" withString:@""];
	
	//NSLog(@"xmlStr :: %@", xmlStr);
	
	NSError *error;
	
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xmlStr options:0 error:&error];
    if (doc == nil) { 
		// NSLog(@"doc doesn't exist");
		return nil; 
	}
	
	
	GDataXMLElement *anElement = [doc rootElement];
	
	//NSLog(@"stringValue :: %@", anElement.stringValue);
	
	if (anElement) {
		return anElement.stringValue;
	}
	else {
		return @"";
	}
	
}

//convert xml string into object the same type as given object.
-(id)fromXml:(NSString *)xmlString withObject:(id)obj{
	
	NSString *xmlStr = [xmlString stringByReplacingOccurrencesOfString:@"ns1:" withString:@""];
	NSError *error;
	
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xmlStr options:0 error:&error];
    if (doc == nil) { 
		// NSLog(@"doc doesn't exist");
		return nil; 
	}
	
    NSMutableDictionary *propertyDic = [XmlParser propertDictionary:obj];
	
	const char *objectName = class_getName([obj class]);
	NSString *objectNameStr = [NSString stringWithCString:objectName encoding:NSASCIIStringEncoding];
	
	NSArray *objects;
	
	
	if ([objectNameStr isEqualToString:[[doc rootElement] name]]) {
		objects = [NSArray arrayWithObject:[doc rootElement]];
	} else {
		objects = [doc nodesForXPath:[NSString stringWithFormat:@"//%@", objectNameStr] error:nil];
	}
	
	if (![objects count]) {
		return nil;
	}
	
	NSObject * createdObject;
	
	NSMutableArray *returnArray = [[NSMutableArray alloc] init]; 
 
    for (GDataXMLElement *thisObject in objects) {
		
		createdObject = [[NSClassFromString(objectNameStr) alloc] init];
		
  		for (NSString *key in propertyDic) {
			
			NSArray *anArray = [thisObject elementsForName:key];
			
			if (anArray.count > 0) {
				GDataXMLElement *anElement = (GDataXMLElement *) [anArray objectAtIndex:0];
				
				if ([[propertyDic objectForKey:key] isEqualToString:nsNumberType]) {
					
					NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
					[f setNumberStyle:NSNumberFormatterDecimalStyle];
					NSNumber * aNumber = [f numberFromString:anElement.stringValue];
					[f release];
					
					
					[createdObject setValue:aNumber forKey:key];
				} else if([[propertyDic objectForKey:key] isEqualToString:booleanType]){
					[createdObject setValue:[NSNumber numberWithInt:[anElement.stringValue boolValue]] forKey:key];
					
				} else {
					[createdObject setValue:anElement.stringValue forKey:key];
				}
			}
		}

		[returnArray addObject:createdObject];
		[createdObject release];
	}
	[doc release];
	
	return returnArray;

}





-(NSString *)toXml:(id)object andTag:(NSString *)tag inNameSpace:(NSString *)nameSpace{
	
	const char *objectName = class_getName([object class]);
	
	NSString *objectNameStr = [[NSString alloc] initWithBytes:objectName length:strlen(objectName) encoding:NSASCIIStringEncoding];
	
	GDataXMLElement * objectElement = [GDataXMLNode elementWithName:objectNameStr];
	
	[objectElement addNamespace:[GDataXMLNode namespaceWithName:nil stringValue:nameSpace]];
	
    NSMutableDictionary * propertyDic = [XmlParser propertDictionary:object];
	
    NSString *nodeValue = [NSString stringWithFormat:@"%@",@""];
	
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
	
	NSString *xmlString = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
	
	NSString *bodyString = [xmlString substringFromIndex:21];
	
	NSString *headerString = [XmlHeaderHelper generateXmlHeader:tag and:nameSpace];
	
	xmlString = [NSString stringWithFormat:@"%@%@",headerString,bodyString];
	
	// NSLog(@"xml string is :: %@",xmlString);
	
	[objectNameStr release];
	[document release];
	return xmlString;
}




@end
