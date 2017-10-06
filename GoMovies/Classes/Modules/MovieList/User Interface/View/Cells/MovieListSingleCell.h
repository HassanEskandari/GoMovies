//
//  MovieListSingleCell.h
//  GoMovies
//
//  Created by Hassan on 10/4/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieListSingleCell : UITableViewCell

@property (strong, nonatomic) Movie *movie;

@property (weak, nonatomic) IBOutlet UIView *movieInfoContainerView;

@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;

@property (weak, nonatomic) IBOutlet UIView *movieRatingShadowView;
@property (weak, nonatomic) IBOutlet UILabel *movieRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieGenreLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieIndicatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieDurationLabel;
@property (weak, nonatomic) IBOutlet UILabel *moviePlotLabel;

@property (weak, nonatomic) IBOutlet UIButton *movieActionMenuButton;


@property (weak, nonatomic) IBOutlet UIButton *movieLikeButton;
@property (weak, nonatomic) IBOutlet UIButton *movieCommentButton;

@property (weak, nonatomic) IBOutlet UIView *separatorView;

- (void)populateWithMovieInfo: (Movie *)movie;

@end
