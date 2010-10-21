===============================================================================
Description
===============================================================================

This is the FeeFactor Objective-C Client Library - a helper library for 
consuming FeeFactor Web Services. FeeFactor Web Services is used to access the 
Netmobo platform which serves as a worry-free and cost-effective back office 
for mobile applications.

===============================================================================
Introduction
===============================================================================

This library is geared for use in iOS applications.

To use the library, please sign up for a Netmobo  account at 
http://www.netmobo.com.

For assistance and more information, please email us at support@netmobo.com.

===============================================================================
Initial Steps for Using this Library in iOS applications
=============================================================================== 
 
With both your app project and the Netmobo source project open, do the 
following:

1. Drag from the Netmobo source project Frameworks group the file 'libNetmobo.a' 
   to your project's Frameworks group and make sure 'copy' is selected from the 
   alert window.

2. Next, drag the grouping 'Netmobo' which contains the library's header files, 
   from the Netmobo source project to your project and make sure 'copy' is 
   selected from the alert window.

3. From the XCode menu, select 'Project' -> 'Edit Project Settings' and click 
   on the 'Build' tab

4. search for 'Header Search Paths' which is under 'Search Paths'

5. click '+' and double-click on 'path' and type in '/usr/include/libxml2'

6. search for 'other linker Flags' which is under 'linking'

7. click '+' and add '-lxml2' 

Optionally, if you are having problems compiling, you may also add the ff to 
'other link': 

   -ObjC
   -all_load


===============================================================================
Authentication
=============================================================================== 


Create two UITextField IBOutlets to receive the user's username and password. 
In this example, this is how we declared the IBOutlets:

//
//  LoginViewController.h
//  Reward
//
//  Created by Netmobo on 8/20/10.
//

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController <UITextFieldDelegate> {
	UITextField *username;
	UITextField *pw;
}

@property (nonatomic, retain) IBOutlet UITextField *username;
@property (nonatomic, retain) IBOutlet UITextField *pw;

- (IBAction) processLogin:(id) sender;

@end

Then in the implementation code, the username and password are passed to your 
app's delegate to process the web service that will authenticate login. After 
authentication, it will return an NSString variable. In this example, we store 
the returned string in the variable 'errorCodeMsg'. errorCodeMsg will return 
'none' if authentication was successful, otherwise, tell user in an error 
message that there was something wrong with their login and that they could try 
again:

- (IBAction) processLogin:(id) sender {
	[self.pw resignFirstResponder];
	
	NSString *usernameStr = [self.username text];
	NSString *passwordStr = [self.pw text];
	
	// user's username and password are passed to the
	// delegate method 'loginWithUser: andPassword:'
	RewardAppDelegate *mainDelegate = (RewardAppDelegate *)[[UIApplication 
            sharedApplication] delegate];
	
	NSString *errorCodeMsg = [mainDelegate loginWithUser:usernameStr 
            andPassword:passwordStr];
	
	// a singleton global variable called 'isLoggedIn' is used
	// to keep track throughout the app that the user is logged in
	Model *model = [Model sharedModel];
	
	if ([errorCodeMsg isEqualToString:@"none"]) {
		[model setIsLoggedIn:@"Y"];
		
		// after setting global variable, let user into your app
		// in this case, it goes to the pointHistory page which 
		// lists user's points history
		[mainDelegate goPointHistory];
	} else {
		// if there is a problem with login (wrong username or password
		// or unable to connect to web service, you can let your 
		// user try to log in again
		[model setIsLoggedIn:@"N"];
		UIAlertView *alert;
		alert = [[UIAlertView alloc] initWithTitle:@"Login Error" 
                        message:@"Wrong username or password" delegate:self 
                        cancelButtonTitle:@"Try Again" 
                        otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
}

Here is the code in the delegate that calls the Netmobo web service. First you 
pass the Netmobo authentication fields along with the user's username and 
password, with the username appended to the app's brandID. Note: there is no 
need to modify the received user password, you can send it to the web service 
as is. After authentication is successful, you will receive an errorCode with a 
string value of "none" which this function returns. After successful web service 
authentication, you may then retrieve needed user information for handling the 
user's session such as userID, serialNumber, accountID:

- (NSString *) loginWithUser:(NSString *) aUser andPassword:(NSString *) aPassword {
	Model *model = [Model sharedModel];
	
	[transport3.config setSchema:@"http"];
	[transport3.config setHost:@"api.feefactor.com"];
	[transport3.config setPort:@"80"]; 
	[transport3.config setServiceUrl:@"//rest"];
	[transport3.config setUserName:[NSString stringWithFormat:@"%@|%@", 
            [model brandID], aUser] ];
	[transport3.config setPassWord:aPassword];
	[transport3.config setEncode:@"UTF-8"];
	[transport3.config setRealm:@"feefactor"];
	
	// after sending the necessary fields for authentication to the
	// FeeFactor web service, you must execute a FeeFactor call to get
	// a return error message describing successful authentication
	// or not. In this case, we try to retrieve user info that
	// will be used throughout the app. We call FeeFactor's
	// accounts method: getAccounts: andSort: andPageItems: andPageNumber:
	// method. During authentication, just pass an empty string
	// to the fields 'getAccounts' and 'andSort' and the number 1
	// to 'andPageItems' and 'andPageNumber'
	Accounts *accountsInterface = [[Accounts alloc] init];
	NSArray *accounts = [[accountsInterface getAccounts:@"" andSort:@"" 
            andPageItems:[NSNumber numberWithInt:1] andPageNumber:[NSNumber 
            numberWithInt:1]] accountResults];

	if ([transport3.config.errorCode isEqualToString:@"none"]) {
		Account *account = [accounts objectAtIndex:0];
		[model setUserID:[account.userID stringValue]];
		[model setSerialNumber:[account.serialNumber stringValue]];	
		[model setAccountID:account.accountID];
	}
	return transport3.config.errorCode;
}