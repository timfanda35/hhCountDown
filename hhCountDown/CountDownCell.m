#import "CountDownCell.h"
#import "MinSecFomatter.h"

@implementation CountDownCell

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    
    if (self) {
        [self setStatus:COUNTDOWN_PAUSE];
        
        MinSecFomatter *formatter = [[MinSecFomatter alloc] init];
        [self setFormatter:formatter];
    }
    
    return self;
}

- (void)setIntValue:(int)anInt
{
    [super setIntValue:anInt];
    
    // Set Record Text Color
    if(anInt <= REST_TIME) {
        [self setStatus:COUNTDOWN_REST];
    }
    else {
       [self setStatus:COUNTDOWN_WORK];
    }
}

#pragma mark CountDownCell

- (void)setStatus:(COUNTDOWN_STATUS)status
{
    switch (status) {
        case COUNTDOWN_WORK:
            [self setTextColor:[NSColor greenColor]];
            break;
        case COUNTDOWN_REST:
            [self setTextColor:[NSColor cyanColor]];
            break;
        case COUNTDOWN_PAUSE:
            [self setTextColor:[NSColor grayColor]];
            break;
        default:
            break;
    }
}

@end
