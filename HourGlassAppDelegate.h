//
//  HourGlassAppDelegate.h
//  HourGlass
//
//  Created by Folker Bernitt on 12.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface HourGlassAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
