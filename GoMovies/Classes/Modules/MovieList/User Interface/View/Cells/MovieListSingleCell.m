//
//  MovieListSingleCell.m
//  GoMovies
//
//  Created by Hassan on 10/4/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MovieListSingleCell.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>
#import <FontAwesomeKit/FontAwesomeKit.h>

#import "NSString+RemoveHtmlTags.h"
#import "NSNumber+TimeFormat.h"

#import "ColorPalette.h"

@implementation MovieListSingleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupViews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    [self setupConstantColors];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    [self setupConstantColors];
}

- (void)setupConstantColors {
    
    self.contentView.backgroundColor = ColorPalette.MovieCellBackgroundColor;
    self.movieInfoContainerView.backgroundColor = ColorPalette.MovieCellInfoBackgroundColor;
    self.separatorView.backgroundColor = ColorPalette.MovieCellSeparatorColor;
    
    self.movieRatingLabel.backgroundColor = ColorPalette.RatingColor;
}

- (void)setupViews {
    
    self.movieInfoContainerView.layer.cornerRadius = 5;
    self.movieInfoContainerView.clipsToBounds = true;
    self.movieInfoContainerView.layer.masksToBounds = false;
    self.movieInfoContainerView.layer.shadowColor = UIColor.grayColor.CGColor;
    self.movieInfoContainerView.layer.shadowOffset = CGSizeMake(0, 2);
    self.movieInfoContainerView.layer.shadowOpacity = 0.7;
    self.movieInfoContainerView.layer.shadowRadius = 5;
    
    self.movieRatingLabel.layer.cornerRadius = self.movieRatingLabel.bounds.size.width / 2;
    self.movieRatingLabel.clipsToBounds = true;

    self.movieRatingShadowView.layer.cornerRadius = self.movieRatingShadowView.bounds.size.width / 2;
    self.movieRatingShadowView.clipsToBounds = true;
    self.movieRatingShadowView.layer.masksToBounds = false;
    self.movieRatingShadowView.layer.shadowColor = UIColor.yellowColor.CGColor;
    self.movieRatingShadowView.layer.shadowOffset = CGSizeMake(0, 1);
    self.movieRatingShadowView.layer.shadowOpacity = 0.7;
    self.movieRatingShadowView.layer.shadowRadius = self.movieRatingShadowView.bounds.size.width / 2;

    self.movieImageView.layer.cornerRadius = 5;
    self.movieImageView.clipsToBounds = true;
}

- (void)populateWithMovieInfo: (Movie *)movie {
    self.movie = movie;
    
    self.movieTitleLabel.text = movie.name;
    self.movieRatingLabel.text = [NSString stringWithFormat:@"%2.1F", [movie.rating.average doubleValue]];
    self.movieGenreLabel.text = [movie.genres componentsJoinedByString:@","];
    self.moviePlotLabel.text = [movie.summary stringByStrippingHTML];
    
    [self.movieImageView sd_setShowActivityIndicatorView:YES];
    [self.movieImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.movieImageView sd_setImageWithURL:[NSURL URLWithString: movie.image.medium] placeholderImage:[UIImage imageNamed:@"MoviePlaceHolder"] options:SDWebImageRetryFailed];
    
    self.movieDurationLabel.text = [NSNumber timeStringFormatted:movie.runtime];
    
    FAKFontAwesome *heartIcon = [FAKFontAwesome heartIconWithSize:16];
    UIImage *heartImage = [heartIcon imageWithSize: CGSizeMake(16, 16)];
    [self.movieLikeButton setTitle:[NSString stringWithFormat:@"   %ld", random() % 500] forState:UIControlStateNormal];
    [self.movieLikeButton setImage:heartImage forState:UIControlStateNormal];
    self.movieLikeButton.tintColor = ColorPalette.MovieCellButtonTintColor;

    FAKFontAwesome *commentIcon = [FAKFontAwesome commentingOIconWithSize:16];
    UIImage *commentImage = [commentIcon imageWithSize: CGSizeMake(16, 16)];
    [self.movieCommentButton setTitle:[NSString stringWithFormat:@"   %ld", random() % 100] forState:UIControlStateNormal];
    [self.movieCommentButton setImage:commentImage forState:UIControlStateNormal];
    self.movieCommentButton.tintColor = ColorPalette.MovieCellButtonTintColor;

}
@end




