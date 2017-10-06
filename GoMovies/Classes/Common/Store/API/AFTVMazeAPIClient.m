//
//  AFTVMazeAPIClient.m
//  GoMovies
//
//  Created by Hassan on 10/5/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import "AFTVMazeAPIClient.h"

static NSString * const AFTVMazeAPIBaseURLString = @"http://api.tvmaze.com";

@implementation AFTVMazeAPIClient

+ (instancetype)sharedClient {
    static AFTVMazeAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFTVMazeAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFTVMazeAPIBaseURLString]];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
        
//        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
