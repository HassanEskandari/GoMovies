//
//  MovieDetailViewController.h
//  GoMovies
//
//  Created by Hassan on 10/06/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailProtocols.h"
#import <HMSegmentedControl/HMSegmentedControl.h>

@interface MovieDetailViewController : UIViewController <MovieDetailViewProtocol, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) Movie *movie;

@property (nonatomic, strong) id <MovieDetailPresenterProtocol> presenter;

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieGenreLabel;

@property (weak, nonatomic) IBOutlet UILabel *imdbBadge;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet HMSegmentedControl *segmentControl;


@end
