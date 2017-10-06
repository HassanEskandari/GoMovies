//
//  ColorPalette.m
//  GoMovies
//
//  Created by Hassan on 10/6/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "ColorPalette.h"
#import "UIColor+Hex.h"

@implementation ColorPalette

+ (UIColor *) MovieCellBackgroundColor { return [UIColor colorWithCSS:@"F0F5F5"]; }
+ (UIColor *) MovieCellInfoBackgroundColor { return [UIColor colorWithCSS:@"FFFFFF"]; }
+ (UIColor *) MovieCellSeparatorColor { return UIColor.blackColor; }
+ (UIColor *) MovieCellButtonTintColor { return [UIColor colorWithCSS:@"333338"]; }

+ (UIColor *) RatingColor { return [UIColor colorWithCSS:@"FFCD00"]; }

+ (UIColor *) IndicatorColor { return [UIColor colorWithCSS:@"FFCD00"]; }

@end
