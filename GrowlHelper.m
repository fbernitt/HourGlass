//
//  GrowlHelper.m
//  HourGlass
//
//  Created by Folker Bernitt on 14.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GrowlHelper.h"
#import <Growl/Growl.h>

@implementation GrowlHelper



#pragma mark Static Methods

+ (void)initGrowl {
	[GrowlApplicationBridge setGrowlDelegate:@""];
}

#pragma mark -
#pragma mark Private Methods
- (void)sendGrowlMessage:(NSString*)notificationName msg:(NSString*)theMessage {
	[GrowlApplicationBridge notifyWithTitle:@"HourGlass" description:theMessage notificationName:notificationName iconData:[NSData data] priority:0 isSticky:FALSE clickContext:nil];
}

#pragma mark -
#pragma mark Public Methods

- (void)taskStarted:(NSString *)message {
	[self sendGrowlMessage:@"taskStarted" msg:message];
}

- (void)taskStopped:(NSString *)message {
	[self sendGrowlMessage:@"taskStopped" msg:message];
}



@end
