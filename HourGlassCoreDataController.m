//
//  HourGlassCoreDataController.m
//  HourGlass
//
//  Created by Folker Bernitt on 14.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HourGlassCoreDataController.h"
#import "HourGlassAppDelegate.h"

@interface NSManagedObject (ProjectAccessors)
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *note;
@property (nonatomic, retain) NSSet *tags;
@property (nonatomic, retain) NSSet *tasks;
@end

@interface NSManagedObject (TagAccessors)
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSSet *projects;
@property (nonatomic, retain) NSSet *tasks;
@end

@implementation HourGlassCoreDataController

- (void)writeToTextView:(NSString *)text {
		if (text) {
			NSTextStorage *storage = [textView textStorage];
			[storage appendAttributedString:[[NSAttributedString alloc] initWithString:text]];
		}
}

- (void)moveToEndOfTextView {
	NSRange endRange;
	NSTextStorage *storage = [textView textStorage];
	endRange.location = [storage length];
	endRange.length = 0;
	[textView scrollRangeToVisible:endRange];
}

- (IBAction)createTags:(id)sender {
	if (appDelegate) {
		NSLog(@"entered createTags with appDelegate");
	} else {
		NSLog(@"entered createTags without appDelegate");
	}
	NSManagedObjectContext *moc = appDelegate.managedObjectContext;
	NSArray *tagList = [NSArray arrayWithObjects:@"home", @"work", @"programming", nil];
	
	for (NSString *name in tagList) {
		NSManagedObject *newTag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc];
		newTag.name = name;
		[moc insertObject:newTag];
	}
	[self writeToTextView:@"Created tags\n\n"];
}

- (IBAction)listAllTags:(id)sender {
}
- (IBAction)createProject:(id)sender {
}
- (IBAction)listAllProjects:(id)sender {
}
- (IBAction)listAllProjectsWithTags:(id)sender {
}

- (NSString *)createTagsString:(NSSet *)tagList {
	NSMutableString *result = [NSMutableString stringWithString:@"[ "];
	for (NSManagedObject *tag in tagList)
		[result appendFormat:@"%@ ", tag.name];
	[result appendString:@"]"];
	
	return result;
}

- (NSString *)createProjectString:(NSManagedObject*)project {
	NSMutableString *result = [NSMutableString new];
	[result appendString:project.title];
	[result appendString:[self createTagsString:project.tags]];
	[result appendString:@"\n"];
	return result;
}

@end
