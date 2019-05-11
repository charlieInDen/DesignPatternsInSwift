//
//  Singleton.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation

protocol Database
{
    func getPopulation(name: String) -> Int
}

class SingletonDatabase : Database
{
    var capitals = [String: Int]()
    static var instanceCount = 0
    static var instance = SingletonDatabase()
    
    private init()
    {
        type(of: self).instanceCount += 1
        print("Initializing database")
        
        let path = "/creational/singleton/imagine.txt" //update your path
        if let text = try? String(contentsOfFile: path as String,
                                  encoding: String.Encoding.utf8)
        {
            let strings = text.components(separatedBy: .newlines)
                .filter { !$0.isEmpty }
                .map { $0.trimmingCharacters(in: .whitespaces)}
            for i in 0..<(strings.count/2)
            {
                capitals[strings[i*2]] = Int(strings[i*2+1])!
            }
        }
    }
    
    func getPopulation(name: String) -> Int {
        capitals = ["alpha": 1, "beta": 2, "gamma": 3]
        return capitals[name]!
    }
}

class SingletonRecordFinder {
    func totalPopulation(names: [String]) -> Int
    {
        var result = 0
        for name in names {
            // singleton database hardcoded here
            result += SingletonDatabase.instance.getPopulation(name: name);
        }
        return result
    }
}

class ConfigurableRecordFinder {
    let database: Database
    init(database: Database)
    {
        self.database = database
    }
    func totalPopulation(names: [String]) -> Int
    {
        var result = 0
        for name in names {
            result += database.getPopulation(name: name);
        }
        return result
    }
}
