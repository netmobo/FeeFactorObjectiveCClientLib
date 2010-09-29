//
//  Image.h
//  FeeFactor
//
//  Created by Netmobo on 1/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Image : NSObject {

	NSString *bytes;
	NSString *fileExtension;
}

@property (nonatomic, retain) NSString *bytes;
@property (nonatomic, retain) NSString *fileExtension;

@end
