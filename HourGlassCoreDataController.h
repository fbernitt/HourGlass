//
//  HourGlassCoreDataController.h
//  HourGlass
//
//  Created by Folker Bernitt on 14.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class HourGlassAppDelegate;

@interface HourGlassCoreDataController : NSObject {
	IBOutlet id textView;
	IBOutlet HourGlassAppDelegate *appDelegate;
}

- (IBAction)createTags:(id)sender;
- (IBAction)listAllTags:(id)sender;
- (IBAction)createProject:(id)sender;
- (IBAction)listAllProjects:(id)sender;
- (IBAction)listAllProjectsWithTags:(id)sender;

@end
