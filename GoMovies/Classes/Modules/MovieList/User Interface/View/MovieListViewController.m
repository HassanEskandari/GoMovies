//
//  MovieListViewController.m
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieListSingleCell.h"

#import "MovieListAPIDataManager.h"

@interface MovieListViewController()
@property (readwrite, nonatomic, strong) NSArray *movies;
@end

@implementation MovieListViewController

- (void)reload:(__unused id)sender {
    
    [MovieListAPIDataManager showsWithBlock:^(NSArray *movies, NSError *error) {
        if (!error) {
            self.movies = movies;
            [self.tableView reloadData];
        }

        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTableView];
    
    [self reload:nil];
}

- (void)setupTableView {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.backgroundColor = UIColor.whiteColor;
    
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = 200;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieListSingleCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"movieListSingleCell"];
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 100.0f)];
    [self.refreshControl addTarget:self action:@selector(reload:) forControlEvents:UIControlEventValueChanged];
    [self.tableView.tableHeaderView addSubview:self.refreshControl];

}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"movieListSingleCell";
    MovieListSingleCell *cell = (MovieListSingleCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell populateWithMovieInfo:[self.movies objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

@end
