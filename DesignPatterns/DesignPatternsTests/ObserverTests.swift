//
//  ObserverTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns

class ObserverTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testSingleRat()
    {
        let game = Game()
        let rat = Rat(game)
        XCTAssertEqual(1, rat.attack)
    }
    
    func testtwoRatTest()
    {
        let game = Game()
        let rat = Rat(game)
        let rat2 = Rat(game)
        XCTAssertEqual(2, rat.attack)
        XCTAssertEqual(2, rat2.attack)
    }
    
    func testthreeRatsOneDies()
    {
        let game = Game()
        
        let rat = Rat(game)
        XCTAssertEqual(1, rat.attack)
        
        let rat2 = Rat(game)
        XCTAssertEqual(2, rat.attack)
        XCTAssertEqual(2, rat2.attack)
        
        do {
            let rat3 = Rat(game)
            
            XCTAssertEqual(3, rat.attack)
            XCTAssertEqual(3, rat2.attack)
            XCTAssertEqual(3, rat3.attack)
            
            rat3.kill()
        }
        
        let msg = "When the 3rd rat dies, the remaining rats' attack value should be =2"
        XCTAssertEqual(2, rat.attack, msg)
        XCTAssertEqual(2, rat2.attack, msg)
    }

}
