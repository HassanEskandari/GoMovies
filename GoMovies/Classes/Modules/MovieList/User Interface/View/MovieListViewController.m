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
#import "ColorPalette.h"
#import "MovieDetailWireFrame.h"

@interface MovieListViewController()
@property (readwrite, nonatomic, strong) NSArray *movies;
@end

@implementation MovieListViewController

- (void)reload:(__unused id)sender {
    [self.refreshControl beginRefreshing];
    [self.presenter reload];
}
- (void)showMovieList:(NSArray *)movies {
    self.movies = movies;
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}
#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupViews];
    [self setupTableView];
    
    [self reload:nil];
}

- (void)setupViews {
    self.title = @"GoMovies";    
}

- (void)setupTableView {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.backgroundColor = ColorPalette.MovieCellBackgroundColor;
    
    self.tableView.rowHeight = 200;
    self.tableView.estimatedRowHeight = 200;
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieListSingleCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"movieListSingleCell"];
    
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 100.0f)];
    [self.refreshControl addTarget:self action:@selector(reload:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];

}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"movieListSingleCell";
    MovieListSingleCell *cell = (MovieListSingleCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell populateWithMovieInfo:[self.movies objectAtIndex:indexPath.row]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Movie *movie = [self.movies objectAtIndex:indexPath.row];
    if(self.navigationController) {
        UIBarButtonItem *newBackButton =
        [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                         style:UIBarButtonItemStylePlain
                                        target:nil
                                        action:nil];
        [[self navigationItem] setBackBarButtonItem:newBackButton];
        [MovieDetailWireFrame presentMovieDetailModuleFrom:self.navigationController forMovie:movie];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

@end
