//
//  MovieListProtocols.h
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MovieListInteractorOutputProtocol;
@protocol MovieListInteractorInputProtocol;
@protocol MovieListViewProtocol;
@protocol MovieListPresenterProtocol;
@protocol MovieListLocalDataManagerInputProtocol;
@protocol MovieListAPIDataManagerInputProtocol;

@class MovieListWireFrame;

// Defines the public interface that something else can use to drive the user interface
@protocol MovieListViewProtocol
@required
@property (nonatomic, strong) id <MovieListPresenterProtocol> presenter;

- (void)showMovieList:(NSArray *)movies;
/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */
@end

@protocol MovieListWireFrameProtocol
@required
+ (void)presentMovieListModuleFrom:(id)fromView;
/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@end

@protocol MovieListPresenterProtocol
@required
@property (nonatomic, weak) id <MovieListViewProtocol> view;
@property (nonatomic, strong) id <MovieListInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <MovieListWireFrameProtocol> wireFrame;
/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
- (void)reload;
@end

@protocol MovieListInteractorOutputProtocol
/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
- (void)movieListLoaded:(NSArray *)movies;
@end

@protocol MovieListInteractorInputProtocol
@required
@property (nonatomic, weak) id <MovieListInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <MovieListAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <MovieListLocalDataManagerInputProtocol> localDataManager;
/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
- (void)reload;
@end


@protocol MovieListDataManagerInputProtocol
/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
@end

@protocol MovieListAPIDataManagerInputProtocol <MovieListDataManagerInputProtocol>

- (NSURLSessionDataTask *)showsWithBlock:(void (^)(NSArray *movies, NSError *error))block;
/**
 * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
 */
@end

@protocol MovieListLocalDataManagerInputProtocol <MovieListDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> LOCLDATAMANAGER
 */
@end
