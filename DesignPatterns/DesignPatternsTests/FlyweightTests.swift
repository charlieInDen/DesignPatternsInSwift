//
//  FlyweightTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns

class FlyweightTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testFlyingWeight()
    {
        let s = Sentence("alpha beta gamma")
        s[1].capitalize = true
        XCTAssertEqual("alpha BETA gamma", s.description)
    }

}
