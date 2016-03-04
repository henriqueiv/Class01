//
//  TrainerTests.swift
//  Class01
//
//  Created by Henrique Valcanaia on 3/3/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import XCTest
@testable import Class01

class TrainerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWebserviceData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = expectationWithDescription("Login completed")
        
        APIManager.sharedInstance.login("ash", password: "mistyS2") { (success, errorMessage, trainer) -> Void in
            expectation.fulfill()
            if success {
                if let trainer = trainer {
                    let validPokemonsCount = trainer.onHandPokemons.count == 6
                    let validAge = trainer.age == 10
                    let validName = trainer.name == "Ash Ketchum"
                    XCTAssertTrue(validPokemonsCount && validAge && validName, "Invalid data!")
                }
            
            } else {
                XCTFail("Unable to login!")
            }
        }
        
        waitForExpectationsWithTimeout(5.0, handler: nil)
    }

}
