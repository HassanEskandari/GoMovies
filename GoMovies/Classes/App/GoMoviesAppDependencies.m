//
//  GoMoviesAppDependencies.m
//  GoMovies
//
//  Created by Hassan on 04/10/17.
//
//

#import "GoMoviesAppDependencies.h"

#import "RootWireframe.h"

@interface GoMoviesAppDependencies ()

@end

@implementation GoMoviesAppDependencies

- (id)initWithWindow:(UIWindow *)window
{
    if ((self = [super init]))
    {
        [self configureDependencies:window];
    }

    return self;
}

- (void)installRootViewController
{
    // *** present first wireframe here
}

- (void)configureDependencies:(UIWindow *)window
{
    // -----
    // root classes
    RootWireframe *rootWireframe = [[RootWireframe alloc] initWithWindow:window];
    window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MovieListViewController"];
    // *** add datastore

    // *** module initialization
}


@end
