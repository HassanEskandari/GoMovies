//
//  MovieDetailProtocols.h
//  GoMovies
//
//  Created by Hassan on 10/06/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Movie.h"

@protocol MovieDetailInteractorOutputProtocol;
@protocol MovieDetailInteractorInputProtocol;
@protocol MovieDetailViewProtocol;
@protocol MovieDetailPresenterProtocol;
@protocol MovieDetailLocalDataManagerInputProtocol;
@protocol MovieDetailAPIDataManagerInputProtocol;

@class MovieDetailWireFrame;

// Defines the public interface that something else can use to drive the user interface
@protocol MovieDetailViewProtocol
@required
@property (nonatomic, strong) id <MovieDetailPresenterProtocol> presenter;
@property (nonatomic) Movie *movie;
/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */
@end

@protocol MovieDetailWireFrameProtocol
@required
+ (void)presentMovieDetailModuleFrom:(id)fromView forMovie:(Movie *)movie;
/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@end

@protocol MovieDetailPresenterProtocol
@required
@property (nonatomic, weak) id <MovieDetailViewProtocol> view;
@property (nonatomic, strong) id <MovieDetailInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <MovieDetailWireFrameProtocol> wireFrame;
/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
@end

@protocol MovieDetailInteractorOutputProtocol
/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
@end

@protocol MovieDetailInteractorInputProtocol
@required
@property (nonatomic, weak) id <MovieDetailInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <MovieDetailAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <MovieDetailLocalDataManagerInputProtocol> localDataManager;
/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
@end


@protocol MovieDetailDataManagerInputProtocol
/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
@end

@protocol MovieDetailAPIDataManagerInputProtocol <MovieDetailDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
 */
@end

@protocol MovieDetailLocalDataManagerInputProtocol <MovieDetailDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> LOCLDATAMANAGER
 */
@end
