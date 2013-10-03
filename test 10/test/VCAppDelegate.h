//
//  VCAppDelegate.h
//  test
//
//  Created by admin on 02.10.13.
//  Copyright (c) 2013 TestAppBundle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    IBOutlet UITabBarController *rootController;
}


@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UITabBarController *rootController;

@end
