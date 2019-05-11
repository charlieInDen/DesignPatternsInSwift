//
//  Command.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation

class Command
{
    enum Action
    {
        case deposit
        case withdraw
    }
    
    var action: Action
    var amount: Int
    var success = false
    
    init(_ action: Action, _ amount: Int)
    {
        self.action = action
        self.amount = amount
    }
}

class Account
{
    var balance = 0
    
    func process(_ c: Command)
    {
        switch c.action
        {
        case .deposit:
            balance += c.amount
            c.success = true
        case .withdraw:
            c.success = (balance >= c.amount)
            if (c.success) { balance -= c.amount }
        }
    }
}
