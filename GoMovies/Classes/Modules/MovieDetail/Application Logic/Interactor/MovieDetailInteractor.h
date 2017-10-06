//
//  MovieDetailInteractor.h
//  GoMovies
//
//  Created by Hassan on 10/06/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieDetailProtocols.h"

@interface MovieDetailInteractor : NSObject <MovieDetailInteractorInputProtocol>

@property (nonatomic, weak) id <MovieDetailInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <MovieDetailAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <MovieDetailLocalDataManagerInputProtocol> localDataManager;

@end
