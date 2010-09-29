//
//  Profile.h
//  FeeFactor
//
//  Created by Netmobo on 18/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

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
