//
//  AFTVMazeAPIClient.h
//  GoMovies
//
//  Created by Hassan on 10/5/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface AFTVMazeAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
