//
//  BuilderTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns


class CodeBuilderTests: XCTestCase
{
    func testBuilder() {
        _ = CodeBuilderTests.allTests
    }
    
    private func process(_ s: String) -> String
    {
        return s.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func emptyTest()
    {
        let cb = CodeBuilder("Test")
        XCTAssertEqual("class Test\n{\n}",
                       process(cb.description))
    }

    func workerTest()
    {
        let cb = CodeBuilder("Worker")
            .addField(called: "name", ofType: "String")
            .addField(called: "age", ofType: "Int")
        XCTAssertEqual("class Worker\n{\n  var name: String\n  var age: Int\n}",
                       process(cb.description))
        print(cb.description)
    }
}

extension CodeBuilderTests
{
    static var allTests : [(String, (CodeBuilderTests) -> () throws -> Void)]
    {
        return [
            ("emptyTest", emptyTest),
            ("personTest", workerTest)
        ]
    }
}
