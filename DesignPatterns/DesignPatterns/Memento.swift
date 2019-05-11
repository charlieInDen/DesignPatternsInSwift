//
//  Memento.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation

class Memento
{
    let balance: Int // immutable
    init(_ balance: Int)
    {
        self.balance = balance
    }
}

class BankAccount : CustomStringConvertible
{
    private var balance: Int
    
    init(_ balance: Int)
    {
        self.balance = balance
    }
    
    func deposit(_ amount: Int) -> Memento
    {
        balance += amount
        return Memento(balance)
    }
    
    func restore(_ m: Memento)
    {
        balance = m.balance
    }
    
    public var description: String
    {
        return "Balance = \(balance)"
    }
}
