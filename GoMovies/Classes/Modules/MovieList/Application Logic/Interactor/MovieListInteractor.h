//
//  MovieListInteractor.h
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieListProtocols.h"

@interface MovieListInteractor : NSObject <MovieListInteractorInputProtocol>

@property (nonatomic, weak) id <MovieListInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <MovieListAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <MovieListLocalDataManagerInputProtocol> localDataManager;

@end
