//
//  MovieListViewController.h
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieListProtocols.h"

@interface MovieListViewController : UIViewController <MovieListViewProtocol, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) id <MovieListPresenterProtocol> presenter;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end
