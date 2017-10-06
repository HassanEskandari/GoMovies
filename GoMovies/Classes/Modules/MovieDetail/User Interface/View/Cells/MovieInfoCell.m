//
//  MovieInfoCell.m
//  GoMovies
//
//  Created by Hassan on 10/7/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "MovieInfoCell.h"
#import "ColorPalette.h"

@implementation MovieInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentView.backgroundColor = ColorPalette.MovieCellBackgroundColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
