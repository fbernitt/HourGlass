//
//  GrowlHelper.h
//  HourGlass
//
//  Created by Folker Bernitt on 14.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GrowlHelper : NSObject {

}

+ (void)initGrowl;

- (void)taskStarted:(NSString *)message;
- (void)taskStopped:(NSString *)message;

@end
