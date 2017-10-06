//
//  NSStringCategoryTests.m
//  GoMoviesTests
//
//  Created by Hassan on 10/7/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+RemoveHtmlTags.h"

@interface NSStringCategoryTests : XCTestCase

@end

@implementation NSStringCategoryTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testRemoveAllHtmlTags {
    
    NSString *htmlString = [@"<html><body><div><a></a><b></b></div></body></html>" stringByStrippingHTML];
    
    XCTAssert([htmlString length] == 0);
}

- (void)testRemoveSelfClosingHtlmTags {
    NSString *htmlString = [@"<br/><br />" stringByStrippingHTML];
    
    XCTAssert([htmlString length] == 0);
}


@end

