//
//  FeefactorVip2AppDelegate.h
//  FeefactorVip2
//
//  Created by Netmobo on 8/24/10.
//  Copyright InstrucToons.com 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeefactorVip2ViewController;

@interface FeefactorVip2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FeefactorVip2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FeefactorVip2ViewController *viewController;

@end

