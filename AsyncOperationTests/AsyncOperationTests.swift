//
//  AsyncOperationTests.swift
//  AsyncOperationTests
//
//  Created by Daniel Williams on 24/08/2015.
//  Copyright © 2015 Dan Williams. All rights reserved.
//

import XCTest
@testable import AsyncOperation

class AsyncOperationTests: XCTestCase {
    
    var operationQueue: NSOperationQueue!
    
    override func setUp() {
        super.setUp()
        operationQueue = NSOperationQueue()
        operationQueue.suspended = true
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        operationQueue = nil
    }
    
    func test_addingOperationToTheQueue_marksTheOperationAsExecuting() {
        let operation = TestAsyncOperation()
        operationQueue.addOperation(operation)
        
        operationQueue.suspended = false
        sleep(1) // Setting suspended to false and then asserting executing = true too quickly will create a race condition
        XCTAssertTrue(operation.executing)
    }
    
    func test_whenTheOperationIsFinished_itIsMarkedAsFinished() {
        let expectation = expectationWithDescription("operation will be marked as finished when the completion block is executed")
        
        let operation = TestAsyncOperation()
        operation.completionBlock = {
            XCTAssertTrue(operation.finished)
            expectation.fulfill()
        }
        
        operationQueue.addOperation(operation)
        operationQueue.suspended = false
        
        waitForExpectationsWithTimeout(10) { error in }
    }
    
    func test_whenAnAsyncOperationIsCreated_theAsynchronousPropertyShouldReturnTrue() {
        let operation = TestAsyncOperation()
        operationQueue.addOperation(operation)
        
        operationQueue.suspended = false
        
        XCTAssertTrue(operation.asynchronous)
    }
}
