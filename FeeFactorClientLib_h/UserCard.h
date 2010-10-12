//
//  UserCard.h
//  FeeFactor
//
//  Created by Netmobo on 25/05/10.
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


@interface UserCard : NSObject {
	
	@protected
	NSString *address1;
    NSString *address2;
    NSNumber *brandID;
    NSNumber *cardID;
    NSString *cardNumber;
    NSString *city;
    NSString *country;
    NSString *currency;
    NSString *emailAddress;
    NSString *expiryMonth;
    NSString *expiryYear;
    NSString *firstName;
    NSString *issuer;
    NSString *lastName;
    NSString *middleInitial;
    NSString *phoneNumber;
    NSString *remarks;
    NSString *state;
    NSNumber *userID;
    NSString *zipcode;

}

@property (nonatomic, copy) NSString *address1;
@property (nonatomic, copy) NSString *address2;
@property (nonatomic, retain) NSNumber *brandID;
@property (nonatomic, retain) NSNumber *cardID;
@property (nonatomic, copy) NSString *cardNumber;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *emailAddress;
@property (nonatomic, copy) NSString *expiryMonth;
@property (nonatomic, copy) NSString *expiryYear;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *issuer;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *middleInitial;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, retain) NSNumber *userID;
@property (nonatomic, copy) NSString *zipcode;

@end
