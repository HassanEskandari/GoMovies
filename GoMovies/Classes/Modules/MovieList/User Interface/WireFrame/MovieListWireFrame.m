//
//  MovieListWireFrame.m
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "MovieListWireFrame.h"

@implementation MovieListWireFrame

+ (void)presentMovieListModuleFrom:(UIViewController*)fromViewController {

    // Generating module components
    id <MovieListViewProtocol> view = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MovieListViewController"];
    id <MovieListPresenterProtocol, MovieListInteractorOutputProtocol> presenter = [MovieListPresenter new];
    id <MovieListInteractorInputProtocol> interactor = [MovieListInteractor new];
    id <MovieListAPIDataManagerInputProtocol> APIDataManager = [MovieListAPIDataManager new];
    id <MovieListWireFrameProtocol> wireFrame= [MovieListWireFrame new];

    // Connecting
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    interactor.APIDataManager = APIDataManager;

    //TODO: ViewController presentation
}

@end
