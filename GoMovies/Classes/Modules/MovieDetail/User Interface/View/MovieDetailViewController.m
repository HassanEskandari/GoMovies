//
//  MovieDetailViewController.m
//  GoMovies
//
//  Created by Hassan on 10/06/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "ColorPalette.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>

@implementation MovieDetailViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSegment];
    [self setupViews];
}

- (void)initSegment
{
    self.segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    self.segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentControl.selectionIndicatorColor = ColorPalette.IndicatorColor;
    self.segmentControl.backgroundColor = ColorPalette.MovieCellBackgroundColor;
    
    self.segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor grayColor],
                                                NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:20.0]
                                                };
    self.segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor],
                                                        NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:20.0]
                                                        };

    [self.segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    
    NSArray *titlesArr = [NSArray arrayWithObjects:@"Info", @"Trailer", @"Comments", @"Awards", @"Review", nil];
    [self.segmentControl setSectionTitles:titlesArr];
    [self.segmentControl setSelectedSegmentIndex:0];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
{
}

- (void) setupViews {

    self.title = @"GoMovies";

    self.tableView.backgroundColor = ColorPalette.MovieCellBackgroundColor;
    
    self.view.backgroundColor = ColorPalette.MovieCellBackgroundColor;
    
    self.movieTitleLabel.text = self.movie.name;
    self.movieGenreLabel.text = [self.movie.genres componentsJoinedByString:@", "];
    
    self.imdbBadge.layer.cornerRadius = 10;
    self.imdbBadge.clipsToBounds = true;
    
    self.movieImageView.layer.cornerRadius = 5;
    self.movieImageView.clipsToBounds = true;

    [self.movieImageView sd_setShowActivityIndicatorView:YES];
    [self.movieImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.movieImageView sd_setImageWithURL:[NSURL URLWithString: self.movie.image.medium] placeholderImage:[UIImage imageNamed:@"MoviePlaceHolder"] options:SDWebImageRetryFailed];

    [self.headerImageView sd_setShowActivityIndicatorView:YES];
    [self.headerImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString: self.movie.image.medium] placeholderImage:[UIImage imageNamed:@"MoviePlaceHolder"] options:SDWebImageRetryFailed];

}
@end



