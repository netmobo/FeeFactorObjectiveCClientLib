//
//  AccountHistorySearchResult.h
//  Netmobo
//
//  Created by Netmobo on 26/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountHistorySearchResult : NSObject {
	
	NSMutableArray *accountHistoryResults;

}

@property (nonatomic, retain) NSMutableArray *accountHistoryResults;

@end
