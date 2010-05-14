//
//  HourGlassAppDelegate.m
//  HourGlass
//
//  Created by Folker Bernitt on 12.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HourGlassAppDelegate.h"

@interface HourGlassAppDelegate ()
@property (nonatomic, readonly) NSString *applicationSupportFolder;
@property (nonatomic,readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end

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

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
	[moc commitEditing];
	if ([moc hasChanges]) [moc save:nil];
	
	return NSTerminateNow;
}

- (NSManagedObjectModel *)managedObjectModel {
	NSLog(@"enter managedObjectModel");
	if (objectModel) {
		return objectModel;
	}
	
	objectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
	return objectModel;
}

- (NSString *)applicationSupportFolder {
	NSLog(@"enter applicationSupportFolder");
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
	NSLog([basePath stringByAppendingPathComponent:@"HourGlass"]);
	return [basePath stringByAppendingPathComponent:@"HourGlass"];
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	NSLog(@"enter persistentStoreCoordinator");
	if (storeCoord) {
		return storeCoord;
	}
	
	NSFileManager *fileManager;
	NSString *applicationSupportFolder;
	NSURL *url;
	
	fileManager = [NSFileManager defaultManager];
	applicationSupportFolder = self.applicationSupportFolder;
	if (![fileManager fileExistsAtPath:applicationSupportFolder]) {
		[fileManager createDirectoryAtPath:applicationSupportFolder attributes:nil];
	}
	
	url = [NSURL fileURLWithPath:[applicationSupportFolder stringByAppendingPathComponent:@"HourGlass.xml"]];
	storeCoord = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
	
	[storeCoord addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:nil];
	return storeCoord;
}

- (NSManagedObjectContext *)managedObjectContext {
	NSLog(@"enter managedObjectContext");
		if (moc) {
			return moc;
		}
	
	NSPersistentStoreCoordinator *coord = self.persistentStoreCoordinator;
	if (coord) {
		moc = [NSManagedObjectContext new];
		[moc setPersistentStoreCoordinator:coord];
	}
	return moc;
}
@end
