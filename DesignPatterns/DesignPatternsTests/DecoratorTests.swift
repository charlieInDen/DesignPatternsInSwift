//
//  DecoratorTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns

class DecoratorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func  testDecorator()
    {
        let dragon = Dragon()
        
        XCTAssertEqual("flying", dragon.fly())
        XCTAssertEqual("too young", dragon.crawl())
        
        dragon.age = 20
        
        XCTAssertEqual("too old", dragon.fly())
        XCTAssertEqual("crawling", dragon.crawl())
    }

}
