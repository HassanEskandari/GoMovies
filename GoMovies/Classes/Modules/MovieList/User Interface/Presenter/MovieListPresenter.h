//
//  MovieListPresenter.h
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieListProtocols.h"

@class MovieListWireFrame;

@interface MovieListPresenter : NSObject <MovieListPresenterProtocol, MovieListInteractorOutputProtocol>

@property (nonatomic, weak) id <MovieListViewProtocol> view;
@property (nonatomic, strong) id <MovieListInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <MovieListWireFrameProtocol> wireFrame;

@end
