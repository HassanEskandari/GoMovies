//
//  RootWireframe.m
//  GoMovies
//
//  Created by Hassan on 04/10/17.
//
//

#import "RootWireframe.h"
#import "MovieListWireFrame.h"

@interface RootWireframe ()
@property UIWindow *window;
@end

@implementation RootWireframe

- (id)initWithWindow:(UIWindow *)window
{
    if ((self = [super init]))
    {
        self.window = window;
    }
    return self;
}

- (void)installRootViewController {
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    
    [MovieListWireFrame presentMovieListModuleFrom:self.window.rootViewController];
    
}

@end
