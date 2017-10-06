//
//  NSInteger+TimeFormat.h
//  GoMovies
//
//  Created by Hassan on 10/6/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (TimeFormat)

+ (NSString *)timeStringFormatted:(NSInteger)totalMinutes;

@end
