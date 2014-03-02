//
//  CountDownField.m
//  hhCountDown
//
//  Created by Bear on 2014/3/2.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "CountDownField.h"
#import "CountDownCell.h"

@implementation CountDownField

- (void)mouseDown:(NSEvent *)theEvent
{
    NSInteger clickCount = [theEvent clickCount];
    [_countDownFieldDelegate handleClick:self withClickCount:clickCount];
}

#pragma mark CountDwonField

- (void)setStatus:(COUNTDOWN_STATUS)status
{
    id cell = [self cell];
    if(cell != nil && [cell isKindOfClass:[CountDownCell class]]) {
        CountDownCell *recordCell = (CountDownCell *)cell;
        [recordCell setStatus:status];
    }
}
@end
