//
//  Image.m
//  FeeFactor
//
//  Created by Netmobo on 1/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Image.h"


@implementation Image

@synthesize bytes;
@synthesize fileExtension;


- (void)dealloc
{
	[bytes release];
	[fileExtension release];
	
	[super dealloc];
}

@end
