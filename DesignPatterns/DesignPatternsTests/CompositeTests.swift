//
//  CompositeTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns

class CompositeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testComposite()
    {
        let singleValue = SingleValue(11)
        let otherValues = ManyValues()
        otherValues.add(22)
        otherValues.add(33)
        XCTAssertEqual(66,
                       [AnySequence(singleValue), AnySequence(otherValues)].sum())
    }

}
