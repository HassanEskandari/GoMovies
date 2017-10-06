//
//  MovieListAPIDataManager.m
//  GoMovies
//
//  Created by Hassan on 10/04/2017.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "MovieListAPIDataManager.h"
#import "AFTVMazeAPIClient.h"
#import "Movie.h"
#import <AFNetworking/AFNetworking.h>

@implementation MovieListAPIDataManager

- (NSURLSessionDataTask *)showsWithBlock:(void (^)(NSArray *movies, NSError *error))block {
    
    return [[AFTVMazeAPIClient sharedClient] GET:@"shows" parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON isKindOfClass: [NSArray class]]) {
            NSArray *moviesFromResponse = [NSArray arrayWithArray:JSON];
            NSMutableArray *mutableMovies = [NSMutableArray arrayWithCapacity:[moviesFromResponse count]];
            for (NSDictionary *attributes in moviesFromResponse) {
                NSError *error;
                Movie *movie = [[Movie alloc] initWithDictionary:attributes error:&error];
                [mutableMovies addObject:movie];
            }
            if (block) {
                block([NSArray arrayWithArray:mutableMovies], nil);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
