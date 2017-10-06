//
//  NSInteger+TimeFormat.m
//  GoMovies
//
//  Created by Hassan on 10/6/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "NSNumber+TimeFormat.h"

@implementation NSNumber (TimeFormat)

+ (NSString *)timeStringFormatted:(NSInteger)totalMinutes {
    long minutes = totalMinutes % 60;
    long hours = totalMinutes / 60;
    
    if(hours > 0 && minutes > 0) {
        return [NSString stringWithFormat:@"%ld hour %ld minute", hours, minutes];
    } else if(hours > 0) {
        return [NSString stringWithFormat:@"%ld hour", hours];
    } else if(minutes > 0) {
        return [NSString stringWithFormat:@"%ld minute", minutes];
    }
    
    return @"";
}

@end
