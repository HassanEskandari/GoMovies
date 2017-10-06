//
//  MovieDetailWireFrame.m
//  GoMovies
//
//  Created by Hassan on 10/06/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "MovieDetailWireFrame.h"

@implementation MovieDetailWireFrame

+ (void)presentMovieDetailModuleFrom:(UIViewController*)fromViewController forMovie:(Movie *)movie {

    // Generating module components
    id <MovieDetailViewProtocol> view = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MovieDetailViewController"];
    id <MovieDetailPresenterProtocol, MovieDetailInteractorOutputProtocol> presenter = [MovieDetailPresenter new];
    id <MovieDetailInteractorInputProtocol> interactor = [MovieDetailInteractor new];
    id <MovieDetailAPIDataManagerInputProtocol> APIDataManager = [MovieDetailAPIDataManager new];
    id <MovieDetailLocalDataManagerInputProtocol> localDataManager = [MovieDetailLocalDataManager new];
    id <MovieDetailWireFrameProtocol> wireFrame= [MovieDetailWireFrame new];

    // Connecting
    view.presenter = presenter;
    view.movie = movie;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    interactor.APIDataManager = APIDataManager;
    interactor.localDataManager = localDataManager;

    //TODO: ViewController presentation
    if ([fromViewController isKindOfClass: [UINavigationController class]]) {
        [(UINavigationController *)fromViewController pushViewController:(UIViewController *)view animated:YES];
    }

}

@end
