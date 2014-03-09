//
//  QFAppDelegate.m
//  Bubble
//
//  Created by 方燕良 on 3/7/14.
//  Copyright (c) 2014 adways. All rights reserved.
//

#import "QFAppDelegate.h"
#import "NSObject+util.h"
#import "NSObject+api.h"
#import "NSObject+param.h"


@implementation QFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	NSArray *arr = @[ @1, @3, @8];
	NSLog(@"%@",arr[1]);
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		
		if ([self getData]) {
			dispatch_async(dispatch_get_main_queue(), ^{
				NSNOTIFICATION(@"success");
				//[[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationRefreshStatus" object:NSLocalizedString(@"Success",nil)];
			});
		}else{
			NSNOTIFICATION(@"Failure");
		}
		
	});
	return YES;
}

-(BOOL)getData
{
#ifdef DEBUG
	NSLog(@"in debug");
#endif
	Api *api = [Api alloc];
	Util *util = [Util alloc];
	NSString *fileName = @"word.plist";
	NSDictionary *ndata;
	
	ndata = [api apiGetWordList];
	if ([ndata count]) {
		if ([util fileExist:[util getDocumentsPath:fileName]]) {
			NSDictionary *data = [util getLocalDataByName:fileName];
			if (!([[data objectForKey:@"version"] isEqualToString:[ndata objectForKey:@"version"]]) || [data count] != [ndata count]) {
				if ([util writeToFile:ndata fileName:fileName]) {
					NSLog(@"local new data: %@",[util getLocalDataByName:fileName]);
				}else{
					NSLog(@"wirte local error , net data: %@",data);
				}
			}
			if ([data count]) {
				NSLog(@"local data : %@",data);
			}
		}
	}else {
		NSLog(@"array size is null");
		return NO;
	}
	return YES;
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
