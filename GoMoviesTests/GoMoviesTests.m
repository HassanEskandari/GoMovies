//
//  GoMoviesTests.m
//  GoMoviesTests
//
//  Created by Hassan on 10/4/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MovieListAPIDataManager.h"

@interface GoMoviesTests : XCTestCase

@end

@implementation GoMoviesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShowsResponse {

    XCTestExpectation *expectation = [self expectationWithDescription:@"Web Service Call Result Expectation"];
    
    XCTAssertNoThrow(
    [MovieListAPIDataManager showsWithBlock:^(NSArray *movies, NSError *error) {

        XCTAssertNil(error);
        XCTAssertNotNil(movies);
        [expectation fulfill];
    }]);
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];    
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
