//
//  MovieListPresenter.m
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "MovieListPresenter.h"
#import "MovieListWireframe.h"

@implementation MovieListPresenter

- (void)reload {
    [self.interactor reload];
}

- (void)movieListLoaded:(NSArray *)movies {
    [self.view showMovieList:movies];
}

@end
