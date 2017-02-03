//
//  TCTimeTests.m
//  TimeChimeObjC
//
//  Created by AJ Schrier on 1/9/17.
//  Copyright © 2017 AJ Schrier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TCTime.h"

@interface TCTimeTests : XCTestCase

@end

@implementation TCTimeTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    TCTime *time = [[TCTime alloc] init];
    NSLog(@"%li:%li:%li", (long)[time hours],
                          (long)[time minutes],
                          (long)[time seconds]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
