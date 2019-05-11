//
//  ProxyTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns

class ProxyTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testProxy()
    {
        let p = LazyPerson()
        p.age = 10
        let rp = ResponsiblePerson(person: p)
        
        XCTAssertEqual("too young", rp.drive(), "Should be too young to drive at age 10")
        XCTAssertEqual("too young", rp.drink(), "Should be too young to drink vodka at age 10")
        XCTAssertEqual("dead", rp.drinkAndDrive(), "Drinking while driving should lead to certain death")
        
        rp.age = 20
        
        XCTAssertEqual("driving", rp.drive(), "Driving at age 20 should be OK")
        XCTAssertEqual("drinking", rp.drink(), "Drinking at age 20 should be OK so long as you do it in moderation")
        XCTAssertEqual("dead", rp.drinkAndDrive(), "Driving while drunk leads to hell")
    }

}
