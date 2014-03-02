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
