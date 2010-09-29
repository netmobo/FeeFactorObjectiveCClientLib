//
//  AccountSearchResult.h
//  FeeFactor
//
//  Created by Netmobo on 17/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountSearchResult : NSObject {
	NSMutableArray *accountResults;
}

@property (nonatomic, copy) NSMutableArray *accountResults;

@end
