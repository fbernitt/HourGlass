//
//  TestController.h
//  HourGlass
//
//  Created by Folker Bernitt on 12.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GrowlHelper.h"

@interface TestController : NSObject <NSSpeechSynthesizerDelegate> {
	NSSpeechSynthesizer *mySpeechSynth;
	GrowlHelper* growl;
	
	IBOutlet id name;
	IBOutlet id okButton;
	IBOutlet id rightDrawer;
}

- (IBAction)doWhatsNecessary: (id)sender;

@end
