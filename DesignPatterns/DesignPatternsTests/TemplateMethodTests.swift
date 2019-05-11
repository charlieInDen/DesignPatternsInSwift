//
//  TemplateMethodTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns

class TemplateMethodTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_impasseTest()
    {
        let c1 = Creature(1, 2)
        let c2 = Creature(1, 2)
        let game = TemporaryCardDamageGame([c1, c2])
        XCTAssertEqual(-1, game.combat(0, 1))
        XCTAssertEqual(-1, game.combat(0, 1))
    }
    
    func test_temporaryMurderTest()
    {
        let c1 = Creature(1, 1)
        let c2 = Creature(2, 2)
        let game = TemporaryCardDamageGame([c1, c2])
        XCTAssertEqual(1, game.combat(0, 1))
    }
    
    func test_doubleMurderTest()
    {
        let c1 = Creature(2, 2)
        let c2 = Creature(2, 2)
        let game = TemporaryCardDamageGame([c1, c2])
        XCTAssertEqual(-1, game.combat(0, 1))
    }
    
    func test_permanentDamageDeathTest()
    {
        let c1 = Creature(1, 2)
        let c2 = Creature(1, 3)
        let game = PermanentCardDamage([c1, c2])
        XCTAssertEqual(-1, game.combat(0, 1))
        XCTAssertEqual(1, game.combat(0, 1))
    }
}
