//
//  MediatorTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns

class MediatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMediator()
    {
        let mediator = Mediator()
        let p1 = Participant(mediator)
        let p2 = Participant(mediator)
        
        XCTAssertEqual(0, p1.value)
        XCTAssertEqual(0, p2.value)
        
        p1.say(2)
        
        XCTAssertEqual(0, p1.value)
        XCTAssertEqual(2, p2.value)
        
        p2.say(4)
        
        XCTAssertEqual(4, p1.value)
        
    }
}
