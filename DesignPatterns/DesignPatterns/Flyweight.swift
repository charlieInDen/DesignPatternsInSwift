//
//  Flyweight.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation

class Sentence : CustomStringConvertible
{
    var words: [String]
    var tokens = [Int: WordToken]()
    
    init(_ plainText: String)
    {
        words = plainText.components(separatedBy: " ")
    }
    
    subscript(index: Int) -> WordToken
    {
        get
        {
            let wt = WordToken()
            tokens[index] = wt
            return tokens[index]!
        }
    }
    
    var description: String
    {
        var ws = [String]()
        for i in 0..<words.count
        {
            var w = words[i]
            if let item = tokens[i]
            {
                if (item.capitalize)
                {
                    w = w.uppercased()
                }
            }
            ws.append(w)
        }
        return ws.joined(separator: " ")
    }
    
    class WordToken
    {
        var capitalize: Bool = false
        init(){}
        init(capitalize: Bool)
        {
            self.capitalize = capitalize
        }
    }
}

