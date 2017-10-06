//
//  GoMoviesAppDelegate.m
//  GoMovies
//
//  Created by Hassan on 04/10/17.
//
//

#import "GoMoviesAppDelegate.h"
#import "GoMoviesAppDependencies.h"

@interface GoMoviesAppDelegate ()

@property (nonatomic, strong) GoMoviesAppDependencies *dependencies;

@end

@implementation GoMoviesAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // initialize window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];

    // initialize dependencies
    GoMoviesAppDependencies *dependencies = [[GoMoviesAppDependencies alloc] initWithWindow:self.window];
    self.dependencies = dependencies;

    // adding RootViewController
    [self.dependencies installRootViewController];

    [_window makeKeyAndVisible];

    return YES;
}

@end
