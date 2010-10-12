//
//  Brand.h
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
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


@interface Brand : NSObject {
	
	@protected
	Boolean active;
    NSNumber * balance;
    NSString *billingEmailAddress;
    NSString *billingSchedule;
    NSNumber * brandID;
    NSNumber * createdBy;
    NSString *creationDate;
    NSNumber * creditLimit;
    NSNumber * defaultProfileID;
    NSString *domain;
    NSNumber * groupID;
    NSString *name;
    NSNumber * paymentGatewayID;
    NSString *preferences;
    NSNumber * referringAgentID;
    NSString *settings;
    NSString *subscriptionType;
    NSString *timeZone;
    NSString *webUrl;

}

@property (nonatomic, assign) Boolean active;
@property (nonatomic, assign) NSNumber * balance;
@property (nonatomic, copy) NSString *billingEmailAddress;
@property (nonatomic, copy) NSString *billingSchedule;
@property (nonatomic, assign) NSNumber * brandID;
@property (nonatomic, assign) NSNumber * createdBy;
@property (nonatomic, copy) NSString *creationDate;
@property (nonatomic, assign) NSNumber * creditLimit;
@property (nonatomic, assign) NSNumber * defaultProfileID;
@property (nonatomic, copy) NSString *domain;
@property (nonatomic, assign) NSNumber * groupID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSNumber * paymentGatewayID;
@property (nonatomic, copy) NSString *preferences;
@property (nonatomic, assign) NSNumber * referringAgentID;
@property (nonatomic, copy) NSString *settings;
@property (nonatomic, copy) NSString *subscriptionType;
@property (nonatomic, copy) NSString *timeZone;
@property (nonatomic, copy) NSString *webUrl;

@end
