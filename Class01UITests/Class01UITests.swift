//
//  Class01UITests.swift
//  Class01UITests
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import XCTest
@testable import Class01

class Class01UITests: XCTestCase {
    
    private let ConnectionTimeOutLimitInSeconds:NSTimeInterval = 5
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launchEnvironment = ["isUITest":"true"]
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testNumberOfRecordsAginstNumberOfCells() {
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        let expectation = expectationWithDescription("Loganu la nu servidor :D")
//        
//        XCUIApplication().buttons["Login"].tap()
//        expectation.fulfill()
//        waitForExpectationsWithTimeout(self.ConnectionTimeOutLimitInSeconds) { (error) in
//            if error != nil {
//                XCTFail("Timed out: \(error!)")
//            } else {
//                XCTAssertTrue(Int(XCUIApplication().tables.cells.count) == 6, "Number of rows in table view must match number of pokemons returned from ws.")
//            }
//        }
//    }
    
}
