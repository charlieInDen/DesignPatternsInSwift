//
//  EmployeeFactory.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation

class Employee
{
    var id: Int
    var name: String
    
    init(called name: String, withId id: Int)
    {
        self.name = name
        self.id = id
    }
}

class EmployeeFactory
{
    private var id = 0
    
    func createEmployee(name: String) -> Employee
    {
        let p = Employee(called: name, withId: id)
        id += 1
        return p
    }
}
