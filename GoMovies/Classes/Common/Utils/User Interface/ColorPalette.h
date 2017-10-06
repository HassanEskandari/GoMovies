//
//  ColorPalette.h
//  GoMovies
//
//  Created by Hassan on 10/6/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorPalette : NSObject

@property (class, readonly) UIColor *MovieCellBackgroundColor;
@property (class, readonly) UIColor *MovieCellInfoBackgroundColor;
@property (class, readonly) UIColor *MovieCellSeparatorColor;
@property (class, readonly) UIColor *MovieCellButtonTintColor;

@property (class, readonly) UIColor *RatingColor;

@property (class, readonly) UIColor *IndicatorColor;
@end
