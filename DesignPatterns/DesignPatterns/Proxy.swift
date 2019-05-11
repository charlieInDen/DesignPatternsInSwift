//
//  Proxy.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation
class LazyPerson
{
    var age: Int = 0
    
    func drink() -> String
    {
        return "drinking"
    }
    
    func drive() -> String
    {
        return "driving"
    }
    
    func drinkAndDrive() -> String
    {
        return "driving while drunk"
    }
}

class ResponsiblePerson
{
    private let person: LazyPerson
    
    init(person: LazyPerson)
    {
        self.person = person
    }
    
    var age: Int
    {
        get { return person.age }
        set(value) { person.age = value }
    }
    
    func drink() -> String
    {
        return (age >= 18) ? person.drink() : "too young"
    }
    
    func drive() -> String
    {
        return (age >= 16) ? person.drive() : "too young"
    }
    
    func drinkAndDrive() -> String
    {
        return "dead"
    }
}
