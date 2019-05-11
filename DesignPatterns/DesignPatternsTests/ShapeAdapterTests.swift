//
//  ShapeAdapterTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns

class ShapeAdapterTests: XCTestCase {

    func testAdapter() {
        _ = ShapeAdapterTests.allTests
    }
    func simpleTest()
    {
        let sq = Square(side: 11)
        let adapter = SquareToRectangleAdapter(sq)
        XCTAssertEqual(121, adapter.area)
    }
}

extension ShapeAdapterTests
{
    static var allTests : [(String, (ShapeAdapterTests) -> () throws -> Void)]
    {
        return [
            ("simpleTest", simpleTest)
        ]
    }
}

