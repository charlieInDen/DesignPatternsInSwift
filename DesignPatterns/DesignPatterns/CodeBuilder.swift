//
//  CodeBuilder.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation
class Field : CustomStringConvertible
{
    var type: String = ""
    var name: String = ""
    init(called name: String, ofType type: String)
    {
        self.name = name
        self.type = type
    }
    public var description: String
    {
        return "var \(name): \(type)"
    }
}

class Class : CustomStringConvertible
{
    var name = ""
    var fields = [Field]()
    
    public var description: String
    {
        var s = ""
        s.append("class \(name)\n{\n")
        for f in fields
        {
            s.append("  \(f)\n")
        }
        s.append("}\n")
        return s
    }
}

class CodeBuilder : CustomStringConvertible
{
    private var theClass = Class()
    
    init(_ rootName: String)
    {
        theClass.name = rootName
    }
    
    func addField(called name: String, ofType type: String) -> CodeBuilder
    {
        theClass.fields.append(Field(called: name, ofType: type))
        return self
    }
    
    public var description: String
    {
        return theClass.description
    }
}
