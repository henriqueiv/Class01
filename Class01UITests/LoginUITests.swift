//
//  LoginUITests.swift
//  Class01
//
//  Created by Henrique Valcanaia on 3/4/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import XCTest

class LoginUITests: XCTestCase {

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
    
    func testLoginTrue() {
        XCUIApplication().textFields["usernameTextField"].tap()
        XCUIApplication().textFields["usernameTextField"].clearAndEnterText("ash")
        
        XCUIApplication().textFields["passwordTextField"].tap()
        XCUIApplication().textFields["passwordTextField"].clearAndEnterText("mistyS2")
        
        XCUIApplication().buttons["Login"].tap()
        
        XCTAssertTrue(XCUIApplication().tables.count == 1, "")
    }
    
    func testLoginFalse() {
        XCUIApplication().textFields["usernameTextField"].tap()
        XCUIApplication().textFields["usernameTextField"].clearAndEnterText("ash2")
        
        XCUIApplication().textFields["passwordTextField"].tap()
        XCUIApplication().textFields["passwordTextField"].clearAndEnterText("mistyS3")
        
        XCUIApplication().buttons["Login"].tap()
        
        XCTAssertTrue(XCUIApplication().tables.count == 0, "")
    }

}
