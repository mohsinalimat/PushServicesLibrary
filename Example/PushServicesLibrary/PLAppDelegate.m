//
//  PLAppDelegate.m
//  PushServicesLibrary
//
//  Created by devalios on 03/30/2016.
//  Copyright (c) 2016 devalios. All rights reserved.
//

#import "PLAppDelegate.h"

#import "Push_services_Library.h" //add

@implementation PLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    }
    else
    {
        // Register for Push Notifications, if running iOS version < 8
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
    }
    
    
    [[Php phpManager]webconnect];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken

{
    
    [[Php phpManager]registerdevice:@"Albi" :deviceToken :@"QWxiaWRiVGVzdE5ldw=="];
    
    NSLog(@"Token:%@", deviceToken);
    
    
}

-(void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if([app applicationState] == UIApplicationStateInactive)
    {
        NSLog(@"Received notifications while inactive.");
    }
    else
    {
        NSLog(@"Received notifications while active.");
    }
    
    for (id key in userInfo) {
        NSLog(@"key: %@, value: %@", key, [userInfo objectForKey:key]);
    }
    
    //////////load aps, custom aps//////////////
    NSDictionary *aps = (NSDictionary *)[userInfo objectForKey:@"custom"];
    NSMutableString *alert = [NSMutableString stringWithString:@""];
    
    if ([aps objectForKey:@"url"])
    {
        [alert appendString:(NSString *)[aps objectForKey:@"url"]];
        
        NSLog(@"Log url:%@",alert);
        
        NSURL *url = [NSURL URLWithString:alert];
        [[UIApplication sharedApplication] openURL:url];
    }
    if ([aps objectForKey:@"Channel"])
    {
        
        
        NSLog(@"Log Channel:%@",[aps objectForKey:@"Channel"]);
    }
    
}
-(void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    
    NSString *str = [NSString stringWithFormat: @"Error: %@", err];
    NSLog(@"Log:%@",str);
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
