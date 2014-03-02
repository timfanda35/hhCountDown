//
//  MainWindowController.m
//  hhCountDown
//
//  Created by Bear on 2014/3/2.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "MainWindowController.h"
#import "Const.h"


@implementation MainWindowController

- (void)windowDidLoad
{
    [super windowDidLoad];

    // set delegate
    [self.countDownField setCountDownFieldDelegate:self];

    self.status = COUNTDOWN_PAUSE;
    [self stop];
}

- (void)dealloc
{
    [self pause];
}

#pragma mark MainWindowController

- (void)initRemainingTime
{
    self.remainingTime = ROUND_TIME;
}

- (void)start
{
    // Avoid application nap
    self.activity = [[NSProcessInfo processInfo] beginActivityWithOptions:NSActivityBackground reason:@"clock no nap"];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (void)stop
{
    [self initRemainingTime];
    [self pause];
}

- (void)pause
{
    bool isValid = [self.timer isValid];
    
    if(isValid) {
        [self.timer invalidate];
        self.timer = nil;
    }
    if (self.activity) {
        // Avoid application nap
        [[NSProcessInfo processInfo] endActivity:self.activity];
        self.activity = nil;
    }

    [self draw];
    [self.countDownField setStatus:COUNTDOWN_PAUSE];
}

- (void)update
{
    self.remainingTime -= 1;
    
    if(self.remainingTime < 0) {
        [self initRemainingTime];
    }
    if(self.remainingTime == ROUND_TIME || self.remainingTime == REST_TIME)
    {
        [self beep];
    }
    
    [self draw];
}

- (void)draw
{
    [self.countDownField setIntValue:self.remainingTime];
}

- (void)beep {
    NSSound *systemSound = [NSSound soundNamed:@"Glass"];
	[systemSound play];
}

#pragma mark CountDownFieldDelegate

- (void)handleClick:(CountDownField *)RecordField withClickCount:(NSInteger)clickCount;
{
    if (2 == clickCount) {
        self.status = COUNTDOWN_PAUSE;
        [self stop];
    }
    else {
        if(self.status == COUNTDOWN_WORK) {
            self.status = COUNTDOWN_PAUSE;
            [self pause];
        }
        else {
            self.status = COUNTDOWN_WORK;
            [self start];
        }
    }
}

@end
