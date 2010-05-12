//
//  TestController.m
//  HourGlass
//
//  Created by Folker Bernitt on 12.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TestController.h"


@implementation TestController

- (IBAction)doWhatsNecessary:(id)sender {
	NSString *nameString = @"Hallo Welt";
	[name setStringValue:nameString];
	[okButton setTitle:nameString];
}
@end
