//
//  GoMoviesAppDependencies.m
//  GoMovies
//
//  Created by Hassan on 04/10/17.
//
//

#import "GoMoviesAppDependencies.h"
#import "RootWireframe.h"
#import "UIColor+Hex.h"

@interface GoMoviesAppDependencies ()
@property RootWireframe *rootWireframe;
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
    [self.rootWireframe installRootViewController];
}

- (void)configureDependencies:(UIWindow *)window
{
    self.rootWireframe = [[RootWireframe alloc] initWithWindow:window];
}


@end
