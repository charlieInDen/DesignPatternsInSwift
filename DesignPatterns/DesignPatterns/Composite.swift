//
//  Composite.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation

class Neuron : Sequence
{
    var inputs = [Neuron]()
    var outputs = [Neuron]()
    
    func makeIterator() -> IndexingIterator<Array<Neuron>>
    {
        return IndexingIterator(_elements: [self])
    }
    
    func connectTo(_ other: Neuron)
    {
        outputs.append(other)
        other.inputs.append(self)
    }
}

class NeuronLayer : Sequence
{
    private var neurons: [Neuron]
    
    init(count: Int)
    {
        neurons = [Neuron](repeating: Neuron(), count: count)
    }
    
    func makeIterator() -> IndexingIterator<Array<Neuron>>
    {
        return IndexingIterator(_elements: neurons)
    }
}

extension Sequence
{
    func connectTo<Seq: Sequence>(_ other: Seq)
        where Seq.Iterator.Element == Neuron,
        Self.Iterator.Element == Neuron
    {
        for from in self
        {
            for to in other
            {
                from.outputs.append(to)
                to.inputs.append(from)
            }
        }
    }
}


//Example 2


class SingleValue : Sequence
{
    var value = 0
    
    init() {}
    init(_ value: Int)
    {
        self.value = value
    }
    
    func makeIterator() -> IndexingIterator<Array<Int>>
    {
        return IndexingIterator(_elements: [value])
    }
}

class ManyValues : Sequence
{
    var values = [Int]()
    
    func makeIterator() -> IndexingIterator<Array<Int>>
    {
        return IndexingIterator(_elements: values)
    }
    
    func add(_ value: Int)
    {
        values.append(value)
    }
}

extension Sequence where Iterator.Element : Sequence,
    Iterator.Element.Iterator.Element == Int
{
    func sum() -> Int
    {
        var result = 0
        for c in self
        {
            for i in c
            {
                result += i
            }
        }
        return result
    }
}

