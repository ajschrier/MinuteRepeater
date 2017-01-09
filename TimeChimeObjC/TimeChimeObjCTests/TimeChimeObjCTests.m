//
//  TimeChimeObjCTests.m
//  TimeChimeObjCTests
//
//  Created by AJ Schrier on 11/6/16.
//  Copyright © 2016 AJ Schrier. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TimeChimeObjCTests : XCTestCase

@end

@implementation TimeChimeObjCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        NSLog(@"%s", __PRETTY_FUNCTION__);
        // Put the code you want to measure the time of here.
    }];
}

@end
