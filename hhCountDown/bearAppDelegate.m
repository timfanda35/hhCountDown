//
//  bearAppDelegate.m
//  hhCountDown
//
//  Created by Bear on 2014/3/2.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "bearAppDelegate.h"

@implementation bearAppDelegate

#pragma mark -

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self.mainWindowController showWindow:self];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    return NSTerminateNow;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

#pragma mark -

- (MainWindowController *)mainWindowController {
    if (_mainWindowController == nil) {
        _mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindowController"];
    }
    return _mainWindowController;
}

@end

