//
//  NSNumberCategoryTests.m
//  GoMoviesTests
//
//  Created by Hassan on 10/7/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+TimeFormat.h"

@interface NSNumberCategoryTests : XCTestCase

@end

@implementation NSNumberCategoryTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConvertingToTimeString {
    
    NSString *formattedTimeString = [NSNumber timeStringFormatted:80];
    NSString *expectedTimeString = @"1 hour 20 minute";
    
    XCTAssertEqualObjects(formattedTimeString, expectedTimeString);
}

@end


