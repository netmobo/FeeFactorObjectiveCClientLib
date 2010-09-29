//
//  AccountInvoicePaymentSearchResult.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccountInvoicePaymentSearchResult : NSObject {
	NSArray *accountInvoicePayment;
}

@property (nonatomic, copy) NSArray *accountInvoicePayment;

@end
