//
//  AppDelegate.m
//  PanaceaApp
//
//  Created by Jacques Questiaux on 2013/11/05.
//  Copyright (c) 2013 Cobiinteractive. All rights reserved.
//

#import "AppDelegate.h"
#import "Panacea.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[Panacea sharedInstance] didFinishLaunchingWithOptions:launchOptions fromViewController:self.window.rootViewController];
    
    [[Panacea sharedInstance] initialiseWithApplicationKey:@"4ca15e2cdac011bf0594b75d4003c209f48e"]; //2342dabc3547612956392bfacdad32cbdf31
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    [[Panacea sharedInstance] stopMonitoringLocationUpdates];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    [[Panacea sharedInstance] applicationWillEnterForegroundFromViewController:self.window.rootViewController];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [[Panacea sharedInstance] startMonitoringLocationUpdates];
    
    [[Panacea sharedInstance] applicationDidBecomeActiveFromViewController:self.window.rootViewController];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [[Panacea sharedInstance] didRegisterForRemoteNotificationsWithDeviceToken:deviceToken]; //this needs to happen before the panacea registration takes place (which happens when opening the inbox) since it is used in the registration process (which will be the case if you leave the registerForRemoteNotificationTypes: in didFinishLaunchingWithOptions: but you could change this if you want
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}

- (void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    NSLog(@"didReceiveRemoteNotification %@", userInfo);
    
    [[Panacea sharedInstance] didReceiveRemoteNotification:userInfo];
}

- (void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    NSLog(@"didReceiveLocalNotification");
    
    [[Panacea sharedInstance] didReceiveLocalNotification:notification withViewController:self.window.rootViewController];
}

@end