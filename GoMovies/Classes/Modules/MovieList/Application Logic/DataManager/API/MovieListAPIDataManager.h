//
//  MovieListAPIDataManager.h
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieListProtocols.h"

@interface MovieListAPIDataManager : NSObject <MovieListAPIDataManagerInputProtocol>

+ (NSURLSessionDataTask *)showsWithBlock:(void (^)(NSArray *movies, NSError *error))block;

@end
