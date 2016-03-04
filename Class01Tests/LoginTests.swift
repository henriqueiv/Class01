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
    
    private let ConnectionTimeOutLimitInSeconds:NSTimeInterval = 5
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testLoginTrue() {
        let expectation = expectationWithDescription("Done")
        
        let user = "ash"
        let pwd = "mistyS2"
        APIManager.sharedInstance.login(user, password: pwd) { (login:Bool, errorMessage:String, trainer:Trainer?) in
            XCTAssertTrue(login, "Wrong user or password!")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(self.ConnectionTimeOutLimitInSeconds, handler: nil)
    }
    
    func testLoginFalse() {
        let expectation = expectationWithDescription("Done")
        
        let user = "ash222"
        let pwd = "mistyS2"
        APIManager.sharedInstance.login(user, password: pwd) { (login:Bool, errorMessage:String, trainer:Trainer?) in
            XCTAssertFalse(login, "Right user or password. THIS SHOULD FAIL!")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(self.ConnectionTimeOutLimitInSeconds, handler: nil)
    }
    
}
