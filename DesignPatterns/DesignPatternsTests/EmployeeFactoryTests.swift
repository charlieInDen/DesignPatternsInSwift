//
//  EmployeeFactoryTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns


class EmployeeFactoryTests: XCTestCase {
    
    func simpleTest()
    {
        let pf = EmployeeFactory()
        
        let p1 = pf.createEmployee(name: "Arvind")
        XCTAssertEqual("Arvind", p1.name)
        
        let p2 = pf.createEmployee(name: "Nishant")
        XCTAssertEqual(1, p2.id)
    }
}

extension EmployeeFactoryTests
{
    static var allTests : [(String, (EmployeeFactoryTests) -> () throws -> Void)]
    {
        return [
            ("simpleTest", simpleTest)
        ]
    }
}

