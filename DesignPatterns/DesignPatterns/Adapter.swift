//
//  Adapter.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation


class VectorObject : Sequence
{
    var lines = [Line]()
    
    func makeIterator() -> IndexingIterator<Array<Line>>
    {
        return IndexingIterator(_elements: lines)
    }
}

class VectorRectangle : VectorObject
{
    init(_ x: Int, _ y: Int, _ width: Int, _ height: Int)
    {
        super.init()
        lines.append(Line(start: Point(x: x, y: y), end: Point(x: x+width,y:  y)))
        lines.append(Line(start: Point(x: x+width, y: y), end: Point(x: x+width,y:  y+height)))
        lines.append(Line(start: Point(x: x,y: y), end: Point(x: x,y: y+height)))
        lines.append(Line(start: Point(x: x,y: y+height), end: Point(x: x+width,y:  y+height)))
    }
}

class LineToPointAdapter : Sequence
{
    private static var count = 0
    var points = [Point]()
    
    init(_ line: Line)
    {
        type(of: self).count += 1
        print("\(type(of: self).count): Generating points for line ",
            "[\(line.start.x),\(line.start.y)]-[\(line.end.x),\(line.end.y)]")
        
        let left = Swift.min(line.start.x, line.end.x)
        let right = Swift.max(line.start.x, line.end.x)
        let top = Swift.min(line.start.y, line.end.y)
        let bottom = Swift.max(line.start.y, line.end.y)
        let dx = right - left
        let dy = line.end.y - line.start.y
        
        if dx == 0
        {
            for y in top...bottom
            {
                points.append(Point(x: left, y: y))
            }
        } else if dy == 0
        {
            for x in left...right
            {
                points.append(Point(x: x,y: top))
            }
        }
    }
    
    func makeIterator() -> IndexingIterator<Array<Point>>
    {
        return IndexingIterator(_elements: points)
    }
}

func drawPoint(_ p: Point)
{
    print(".", terminator: "")
}
