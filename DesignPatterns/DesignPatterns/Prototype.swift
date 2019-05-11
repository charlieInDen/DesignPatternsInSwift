//
//  Prototype.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation

class Point
{
    var x = 0
    var y = 0
    
    init() {}
    
    init(x: Int, y: Int)
    {
        self.x = x
        self.y = y
    }
}

class Line
{
    var start = Point()
    var end = Point()
    
    init(start: Point, end: Point)
    {
        self.start = start
        self.end = end
    }
    
    func deepCopy() -> Line
    {
        let newStart = Point(x: start.x, y: start.y)
        let newEnd = Point(x: end.x, y: end.y)
        return Line(start: newStart, end: newEnd)
    }
}
