//
//  TestController.m
//  HourGlass
//
//  Created by Folker Bernitt on 12.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TestController.h"

@implementation TestController

#pragma mark -
#pragma mark Initialization

- (void)awakeFromNib {
	mySpeechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
	[mySpeechSynth setDelegate:self];
	growl = [[GrowlHelper alloc] init];
	[GrowlHelper initGrowl];
}

-(void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:
(BOOL) finishedSpeaking
{
	[name setStringValue:@"Finished"];
}

#pragma mark -
#pragma mark Public Methods

- (IBAction)doWhatsNecessary:(id)sender {
	NSString *nameString = @"Hallo Welt";
	[name setStringValue:nameString];
	[okButton setTitle:nameString];
	[mySpeechSynth startSpeakingString:@"Hello World"];
	[growl taskStarted:@"Started the task"];
}
@end
