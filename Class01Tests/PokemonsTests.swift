//
//  PokemonsTests.swift
//  Class01
//
//  Created by Henrique Valcanaia on 3/4/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import XCTest
@testable import Class01

class PokemonsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPokemonDataFromWS() {
        let expectation = expectationWithDescription("Done")
        
        APIManager.sharedInstance.login("ash", password: "mistyS2") { (success, errorMessage, trainer) -> Void in
            expectation.fulfill()
            if success {
                let validPokemonsCount = trainer!.onHandPokemons.count == 6
                var validSkillsCount = false
                for pokemon in trainer!.onHandPokemons {
                    validSkillsCount = pokemon.skills.count == 4
                    if !validSkillsCount {
                        break
                    }
                }
                
                XCTAssertTrue(validSkillsCount && validPokemonsCount, "Wrong data from WS!")
            } else {
                XCTFail("Unable to login")
            }
        }
        
        waitForExpectationsWithTimeout(5.0, handler: nil)
    }

}
