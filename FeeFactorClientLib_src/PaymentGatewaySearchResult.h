//
//  PaymentGatewaySearchResult.h
//  FeefactorVip2
//
//  Created by Vicente Malixi on 9/15/10.
//  Copyright 2010 Aurisoft. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PaymentGatewaySearchResult : NSObject {
	NSMutableArray *paymentGatewayInfoSearchResult;
}

@property (nonatomic, retain) NSMutableArray *paymentGatewayInfoSearchResult;

@end
