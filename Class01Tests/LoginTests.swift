//
//  LoginTests.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import XCTest
@testable import Class01

class LoginTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testLoginTrue() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = expectationWithDescription("Loganu la nu servidor :D")
        
        let user = "ash"
        let pwd = "mistyS2"
        APIManager.sharedInstance.login(user, password: pwd) { (login:Bool, errorMessage:String, trainer:Trainer?) in
            XCTAssertTrue(login, "Wrong user or password!")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5.0, handler: nil)
        waitForExpectationsWithTimeout(5.0) { (error) in
            XCTFail("\(#function)::Timed out")
        }
    }
    
    func testLoginFalse() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = expectationWithDescription("Loganu la nu servidor :D")
        
        let user = "ash"
        let pwd = "mistyS2"
        APIManager.sharedInstance.login(user, password: pwd) { (login:Bool, errorMessage:String, trainer:Trainer?) in
            XCTAssertFalse(login, "Right user or password. THIS SHOULD FAIL!")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5.0) { (error) in
            XCTFail("\(#function)::Timed out")
        }
    }

}
