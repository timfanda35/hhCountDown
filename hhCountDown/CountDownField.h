//
//  CountDownField.h
//  hhCountDown
//
//  Created by Bear on 2014/3/2.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "Const.h"

@class CountDownField;

@protocol CountDownFieldDelegate <NSObject>

- (void)handleClick:(CountDownField *)RecordField withClickCount:(NSInteger)clickCount;

@end

#pragma mark -

@interface CountDownField : NSTextField

@property (nonatomic) id<CountDownFieldDelegate> countDownFieldDelegate;

- (void)setStatus:(COUNTDOWN_STATUS)status;

@end
