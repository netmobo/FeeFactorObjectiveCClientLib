//
//  TransactionDetailRecord.h
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


@interface TransactionDetailRecord : NSObject {
	NSNumber * accountBatchNumber;
    NSString * accountID;
    NSString * accountType;
    NSString * brandExchangeCode;
    NSNumber * brandID;
    NSString * brandName;
    NSNumber * brandProductID;
    NSNumber * brandServiceID;
    NSString * brandServiceName;
    NSNumber * charge;
    NSString * currency;
    NSString * description;
    NSString * destination;
    NSString * errorCode;
    NSNumber * initialBrandBaserate;
    NSNumber * localCharge;
    NSNumber * planCharge;
    NSString * planDescription;
    NSNumber * planID;
    NSString * productCode;
    NSNumber * quantity;
    NSNumber * serialNumber;
    NSString * sessionID;
    NSNumber * status;
    NSString * time;
    NSNumber * transactionDetailRecordID;
    NSString * unitPrice;
    NSNumber * userAntiTdr;
    NSNumber * userBrID;
    NSNumber * userID;
    NSString * username;
}

@property (nonatomic, retain) NSNumber *accountBatchNumber;
@property (nonatomic, copy) NSString *accountID;
@property (nonatomic, copy) NSString *accountType;
@property (nonatomic, copy) NSString *brandExchangeCode;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, retain) NSNumber *brandProductID;
@property (nonatomic, retain) NSNumber *brandServiceID;
@property (nonatomic, copy) NSString *brandServiceName;
@property (nonatomic, retain) NSNumber *charge;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *destination;
@property (nonatomic, copy) NSString *errorCode;
@property (nonatomic, retain) NSNumber *initialBrandBaserate;
@property (nonatomic, retain) NSNumber *localCharge;
@property (nonatomic, retain) NSNumber *planCharge;
@property (nonatomic, copy) NSString *planDescription;
@property (nonatomic, retain) NSNumber *planID;
@property (nonatomic, copy) NSString *productCode;
@property (nonatomic, retain) NSNumber *quantity;
@property (nonatomic, retain) NSNumber *serialNumber;
@property (nonatomic, copy) NSString *sessionID;
@property (nonatomic, retain) NSNumber *status;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, retain) NSNumber *transactionDetailRecordID;
@property (nonatomic, copy) NSString *unitPrice;
@property (nonatomic, retain) NSNumber *userAntiTdr;
@property (nonatomic, retain) NSNumber *userBrID;
@property (nonatomic, retain) NSNumber *userID;
@property (nonatomic, copy) NSString *username;

@end
