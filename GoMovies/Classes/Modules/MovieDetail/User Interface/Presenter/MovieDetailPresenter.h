//
//  MovieDetailPresenter.h
//  GoMovies
//
//  Created by Hassan on 10/06/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieDetailProtocols.h"

@class MovieDetailWireFrame;

@interface MovieDetailPresenter : NSObject <MovieDetailPresenterProtocol, MovieDetailInteractorOutputProtocol>

@property (nonatomic, weak) id <MovieDetailViewProtocol> view;
@property (nonatomic, strong) id <MovieDetailInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <MovieDetailWireFrameProtocol> wireFrame;

@end
