//
//  BillingRecord.h
//  FeeFactor
//
//  Created by Netmobo on 6/06/10.
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

#import <Foundation/Foundation.h>


@interface BillingRecord : NSObject {
	NSString * accountID;
    NSNumber * accountOwnerID;
    NSNumber * amount;
    Boolean archived;
    NSNumber * billingRecordID;
    NSNumber * brType;
    NSNumber * brandID;
    NSString * dateFrom;
    NSString * dateTo;
    NSString * description;
    NSNumber * groupID;
    NSNumber * invoiceNumber;
    NSNumber * productID;
    NSNumber * quantity;
    NSString * remarks;
    NSNumber * transactionCount;
    NSString * unit;
    NSString * unitPrice;
    NSNumber * userID;
}

@property (nonatomic, copy) NSString *accountID;
@property (nonatomic, retain) NSNumber *accountOwnerID;
@property (nonatomic, retain) NSNumber *amount;
@property (nonatomic, assign) Boolean archived;
@property (nonatomic, retain) NSNumber *billingRecordID;
@property (nonatomic, retain) NSNumber *brType;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, copy) NSString *dateFrom;
@property (nonatomic, copy) NSString *dateTo;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, retain) NSNumber *groupID;
@property (nonatomic, retain) NSNumber *invoiceNumber;
@property (nonatomic, retain) NSNumber *productID;
@property (nonatomic, retain) NSNumber *quantity;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, retain) NSNumber *transactionCount;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSString *unitPrice;
@property (nonatomic, retain) NSNumber *userID;

@end
