//
//  FeeFactorClientLib_hAppDelegate.h
//  FeeFactorClientLib_h
//
//  Created by Vicente Malixi on 9/16/10.
//  Copyright Aurisoft 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeeFactorClientLib_hViewController;

@interface FeeFactorClientLib_hAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FeeFactorClientLib_hViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FeeFactorClientLib_hViewController *viewController;

@end

