//
//  MinSecFomatter.m
//  hhCountDown
//
//  Created by Bear on 2014/3/2.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "MinSecFomatter.h"

@implementation MinSecFomatter

- (NSString *)stringForObjectValue:(id)anObject {
    
    if (![anObject isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    int anInt = [anObject intValue];
    int min = anInt / 60;
    int sec = anInt % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d", min, sec];
}

@end
