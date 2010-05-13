//
//  PreferencesAppDelegate.m
//
//  Created by Folker Bernitt on 13.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PreferencesAppDelegate.h"

@implementation PreferencesAppDelegate



-(void)windowDidBecomeKey:(NSNotification *)notification {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	[UserPrefField setStringValue:[defaults stringForKey:@"user"]];
	[PasswordPrefField setStringValue:[defaults stringForKey:@"password"]];
	NSLog(@"Loaded preferences");
}

-(void)windowDidResignKey:(NSNotification *)notification {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setObject:[UserPrefField stringValue] forKey:@"user"];
	[defaults setObject:[PasswordPrefField stringValue] forKey:@"password"];
	
	[defaults synchronize];
	NSLog(@"Stored preferences");
}

@end
