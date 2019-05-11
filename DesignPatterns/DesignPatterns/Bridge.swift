//
//  Bridge.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation
//example 1
protocol Renderer
{
    func renderCircle(_ radius: Float)
}

class VectorRenderer : Renderer
{
    func renderCircle(_ radius: Float)
    {
        print("Drawing a circle or radius \(radius)")
    }
}

class RasterRenderer : Renderer
{
    func renderCircle(_ radius: Float)
    {
        print("Drawing pixels for circle of radius \(radius)")
    }
}

protocol Shape
{
    func draw()
    func resize(_ factor: Float)
}

class Circle : Shape
{
    var radius: Float
    var renderer: Renderer
    
    init(_ renderer: Renderer, _ radius: Float)
    {
        self.renderer = renderer
        self.radius = radius
    }
    
    func draw()
    {
        renderer.renderCircle(radius)
    }
    
    func resize(_ factor: Float)
    {
        radius *= factor
    }
}


//Another example
protocol Render
{
    var whatToRenderAs: String { get }
}

class Shapes : CustomStringConvertible
{
    private let render: Render
    
    init(_ render: Render)
    {
        self.render = render
    }
    
    var name: String = ""
    
    var description: String
    {
        return "Drawing \(name) as \(render.whatToRenderAs)"
    }
}

class Triangle : Shapes
{
    override init(_ render: Render)
    {
        super.init(render)
        name = "Triangle"
    }
}

class Squares : Shapes
{
    override init(_ render: Render)
    {
        super.init(render)
        name = "Square"
    }
}

class RasterRender : Render
{
    var whatToRenderAs: String {
        return "pixels"
    }
}

class VectorRender : Render
{
    var whatToRenderAs: String
    {
        return "lines"
    }
}
