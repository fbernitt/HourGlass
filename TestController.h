//
//  TestController.h
//  HourGlass
//
//  Created by Folker Bernitt on 12.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TestController : NSObject {
	IBOutlet id name;
	IBOutlet id okButton;
	IBOutlet id rightDrawer;
}

- (IBAction)doWhatsNecessary: (id)sender;

@end
