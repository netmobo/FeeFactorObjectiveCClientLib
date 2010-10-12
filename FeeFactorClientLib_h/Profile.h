//
//  Profile.h
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


@interface Profile : NSObject {
	
	@protected
	NSString *altPhone;
    NSString *city;
    NSString *company;
    NSString *country;
    NSString *dob;
    NSString *email;
    NSString *fax;
    NSString *firstName;
    NSString *imContactInfo;
    NSString *lastName;
    NSString *locale;
    NSString *mi;
    NSString *mobile;
    NSString *others;
    NSString *phone;
	NSNumber * profileID;
    NSString *state;
    NSString *street;
    NSString *street2;
    NSString *suffix;
    NSString *timeZone;
    NSString *title;
    NSString *web;
    NSString *zip;
}

@property (nonatomic, copy) NSString *altPhone;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *dob;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *fax;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *imContactInfo;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *locale;
@property (nonatomic, copy) NSString *mi;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *others;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, assign) NSNumber * profileID;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *street2;
@property (nonatomic, copy) NSString *suffix;
@property (nonatomic, copy) NSString *timeZone;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *web;
@property (nonatomic, copy) NSString *zip;

@end
