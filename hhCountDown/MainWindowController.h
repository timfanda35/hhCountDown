//
//  MainWindowController.h
//  hhCountDown
//
//  Created by Bear on 2014/3/2.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "CountDownField.h"

@interface MainWindowController : NSWindowController<CountDownFieldDelegate>

@property (weak) IBOutlet CountDownField *countDownField;
@property (nonatomic, strong) id activity;

@property (nonatomic) COUNTDOWN_STATUS status;
@property (assign) NSTimer *timer;
@property (assign) int remainingTime;

@end
