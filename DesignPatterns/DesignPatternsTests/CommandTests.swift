//
//  CommandTests.swift
//  DesignPatternsTests
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import XCTest
@testable import DesignPatterns


class CommandTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testCommand()
    {
        let a = Account()
        
        let deposit = Command(.deposit, 100)
        a.process(deposit)
        
        XCTAssertEqual(100, a.balance, "Expected the balance to rise to 100")
        XCTAssert(deposit.success, "A deposit should always succeed")
        
        let withdraw = Command(.withdraw, 50)
        a.process(withdraw)
        
        XCTAssertEqual(50, a.balance)
        XCTAssert(withdraw.success, "Withdrawal of 50 should have succeeded")
        
        let withdraw2 = Command(.withdraw, 100)
        a.process(withdraw2)
        
        XCTAssertEqual(50, a.balance, "After a failed withdrawal, balance should have stayed at exactly 50")
        XCTAssertFalse(withdraw2.success, "Attempted withdrawal should have failed")
    }

}
