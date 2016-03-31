# PushServicesLibrary

[![CI Status](http://img.shields.io/travis/devalios/PushServicesLibrary.svg?style=flat)](https://travis-ci.org/devalios/PushServicesLibrary)
[![Version](https://img.shields.io/cocoapods/v/PushServicesLibrary.svg?style=flat)](http://cocoapods.org/pods/PushServicesLibrary)
[![License](https://img.shields.io/cocoapods/l/PushServicesLibrary.svg?style=flat)](http://cocoapods.org/pods/PushServicesLibrary)
[![Platform](https://img.shields.io/cocoapods/p/PushServicesLibrary.svg?style=flat)](http://cocoapods.org/pods/PushServicesLibrary)
[![Github Releases (by Asset)](https://img.shields.io/github/downloads/atom/atom/latest/PushServicesLibrary.svg)](http://cocoapods.org/pods/PushServicesLibrary)

![Screenshot0][img0]

You need to register on the <a href="https://service.techmobilesoft.com/Count/click.php?id=5">website</a> before.

Read notification output in JSON output
````objective-c
2016-03-03 08:04:12.590 Push_Services[3355:596199] key: aps, value: {
alert = "Test Load ";
badge = 1;
sound = "custom.caf";
}
2016-03-03 08:04:12.591 Push_Services[3355:596199] key: custom, value: {
Channel = all;
url = "https://www.cocoacontrols.com/controls/push_services_framework_example";
}
2016-03-03 08:04:12.591 Push_Services[3355:596199] Log url:https://www.cocoacontrols.com/controls/push_services_framework_example
````

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PushServicesLibrary is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

````ruby
pod "PushServicesLibrary"
````

Project setting add:

Other Linker Flags : <b>-ObjC</b> and  <b>-all_load</b>

1, 
````objective-c
#import "Push_services_Library.h" //add
````

2, 
````objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Override point for customization after application launch.


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

[[Php phpManager]webconnect]; //add

return YES;
}
````
3, 
````objective-c  
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken

{

[[Php phpManager]registerdevice:@"Username" :deviceToken :@"QWxiaWRiU2VydmljZVB1c2g="]; //add

} 
````

Xcode Project Setting **BITCODE_ENABLE=NO**

<center>https://push.techmobilesoft.com/document-help-2.php</center>


[img0]:https://www.techmobilesoft.com/wp-content/uploads/2016/02/push_iphone-git.jpg



## Author

devalios, info@techmobilesoft.com

## License

PushServicesLibrary is available under the MIT license. See the LICENSE file for more info.
