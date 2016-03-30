//
//  Php.h
//  
//
//  Created by Parti Albert on 2015. 07. 30..
//  Copyright (c) 2015. Parti Albert. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Php : NSObject<NSURLSessionDelegate>

@property ( nonatomic, strong) NSArray *frissitesArray;
+ (instancetype) phpManager;

@property NSString *idszam;

-(void)webconnect;
-(void)webconnect2;
-(void)registerdevice:(NSString*)push_username :(NSData*)register_udidData :(NSString*)push_name ;



@end
