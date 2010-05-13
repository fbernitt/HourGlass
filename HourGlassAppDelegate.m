//
//  HourGlassAppDelegate.m
//  HourGlass
//
//  Created by Folker Bernitt on 12.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HourGlassAppDelegate.h"

@implementation HourGlassAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

	NSDictionary *defaultsDict = [NSDictionary dictionaryWithObjectsAndKeys:
								  @"user", @"user",
								  @"password", @"password",
								  nil];
	[[NSUserDefaults standardUserDefaults] registerDefaults:defaultsDict];
	NSLog(@"Initialized preferences");
	// Insert code here to initialize your application 
}

@end
