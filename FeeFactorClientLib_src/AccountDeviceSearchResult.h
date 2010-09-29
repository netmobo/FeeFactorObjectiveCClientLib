//
//  AccountDeviceSearchResult.h
//  FeeFactor
//
//  Created by Netmobo on 1/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountDeviceSearchResult : NSObject {

	NSMutableArray *accountDeviceResults;
}

@property (nonatomic, copy) NSMutableArray *accountDeviceResults;

@end
