//
//  GoMoviesAppDependencies.h
//  GoMovies
//
//  Created by Hassan on 04/10/17.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 Dependency hierarchy for the GoMovies project.
 */
@interface GoMoviesAppDependencies : NSObject

- (id)initWithWindow:(UIWindow *)window;
- (void)installRootViewController;

@end
