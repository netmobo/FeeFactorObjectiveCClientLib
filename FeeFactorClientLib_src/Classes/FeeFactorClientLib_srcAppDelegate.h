//
//  FeeFactorClientLib_srcAppDelegate.h
//  FeeFactorClientLib_src
//
//  Created by Vicente Malixi on 9/16/10.
//  Copyright Aurisoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeeFactorClientLib_srcViewController;

@interface FeeFactorClientLib_srcAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FeeFactorClientLib_srcViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FeeFactorClientLib_srcViewController *viewController;

@end

