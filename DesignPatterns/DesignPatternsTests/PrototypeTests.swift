//
//  PrototypeTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns

class PrototypeTests: XCTestCase
{
    func testPrototype() {
        _ = PrototypeTests.allTests
    }
    func simpleTest()
    {
        let line1 = Line(
            start: Point(x: 3, y: 3),
            end: Point(x: 10, y: 10)
        )
        
        let line2 = line1.deepCopy()
        line1.start.x = 0
        line1.start.y = 0
        line1.end.x = 0
        line1.end.y = 0
        
        XCTAssertEqual(3, line2.start.x)
        XCTAssertEqual(3, line2.start.y)
        XCTAssertEqual(10, line2.end.x)
        XCTAssertEqual(10, line2.end.y)
    }
}

extension PrototypeTests
{
    static var allTests : [(String, (PrototypeTests) -> () throws -> Void)]
    {
        return [
            ("simpleTest", simpleTest)
        ]
    }
}
