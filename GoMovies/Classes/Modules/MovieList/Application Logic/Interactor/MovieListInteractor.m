//
//  MovieListInteractor.m
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "MovieListInteractor.h"

@implementation MovieListInteractor

- (void)reload {

    [self.APIDataManager showsWithBlock:^(NSArray *movies, NSError *error) {
        if (!error) {
            [self.presenter movieListLoaded:movies];
        }
    }];
}

@end
