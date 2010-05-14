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
	
	NSManagedObjectModel *objectModel;
	NSPersistentStoreCoordinator *storeCoord;
	NSManagedObjectContext *moc;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic,readonly) NSManagedObjectContext *managedObjectContext;

@end
