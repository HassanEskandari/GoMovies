//
//  GoMoviesAppDelegate.m
//  GoMovies
//
//  Created by Hassan on 04/10/17.
//
//

#import "GoMoviesAppDelegate.h"
#import "GoMoviesAppDependencies.h"
#import "UIColor+Hex.h"

@interface GoMoviesAppDelegate ()

@property (nonatomic, strong) GoMoviesAppDependencies *dependencies;

@end

@implementation GoMoviesAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeNavigationBar];
    
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

- (void)customizeNavigationBar {
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = UIColor.whiteColor;
    [UINavigationBar appearance].barTintColor = [UIColor colorWithCSS:@"333338"];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: UIColor.whiteColor};
}

@end
