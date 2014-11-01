//
//  AppDelegate.m
//  Fingercise
//
//  Created by James Lane on 10/30/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "AppDelegate.h"
//#import <Darwin.POSIX.netinet.in>

@interface AppDelegate ()

@end

@implementation AppDelegate

// String Constant for Server IP Address
NSString *IP_ADDRESS;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
   /* //declare IP address for server
    [NSString stringWithFormat:(@"10.0.1.18")];
    
    // set up network socket
    CFSocketContext context = { 0, msg, NULL, NULL, NULL };
    CFSocketRef client = CFSocketCreate(NULL, PF_INET, SOCK_STREAM, IPPROTO_TCP,
                                        kCFSocketConnectCallBack, (CFSocketCallBack)ConnectCallBack, &context);

    struct CFSocketContext {
        CFIndex version; // must be 0
        void *info; // data to send
        CFAllocatorRetainCallBack retain; // callback called when do CFRetain, CFRelease,CFCopy
        CFAllocatorReleaseCallBack release;
        CFAllocatorCopyDescriptionCallBack copyDescription;
    };

    CFSocketRef CFSocketCreate (
                                CFAllocatorRef allocator,
                                SInt32 protocolFamily, //PF_INET is IPv4
                                SInt32 socketType,
                                SInt32 protocol,
                                CFOptionFlags callBackTypes, //when we want to be called back
                                CFSocketCallBack callout, //our callback
                                const CFSocketContext *context
                                );
    struct sockaddr_in theName;
    struct hostent *hp;
    CFDataRef addressData;
    
    theName.sin_port = htons(8889);
    theName.sin_family = AF_INET; //what kind in internet addresses to use; want IP
    
    hp = gethostbyname(IP_ADDRESS);
    if( hp == NULL ) {
        return;
    }
    
    memcpy( &theName.sin_addr.s_addr, hp->h_addr_list[0], hp->h_length );
    addressData = CFDataCreate( NULL, (UInt8 *)&theName, (CFIndex)sizeof( struct sockaddr_in ) );*/

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
