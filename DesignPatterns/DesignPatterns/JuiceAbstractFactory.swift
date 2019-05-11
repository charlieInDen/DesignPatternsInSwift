//
//  JuiceFactory.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//
import Foundation

protocol JuiceDrink
{
    func consume()
}

class Mango : JuiceDrink {
    func consume() {
        print("This mango shake is awesome.")
    }
}

class Orange : JuiceDrink {
    func consume() {
        print("This orange juice is delicious!")
    }
}

protocol JuiceDrinkFactory {
    func prepare(amount: Int) -> JuiceDrink
    init()
}

class MangoFactory : JuiceDrinkFactory{
    required init() {}
    func prepare(amount: Int) -> JuiceDrink {
        print("Put 1 mango, pour milk of \(amount) ml, add sugar, enjoy milkshake!")
        return Mango()
    }
}

class OrangeFactory : JuiceDrinkFactory {
    required init() {}
    func prepare(amount: Int) -> JuiceDrink {
        print("Mix some orange, Sugar, pour \(amount) ml, add cream and sugar, enjoy!")
        return Orange()
    }
}

class JuiceDrinkMachine {
    
    enum AvailableDrink : String { // violates open-closed {
        case mango = "Mango"
        case orange = "Orange"
        
        static let all = [mango, orange]
    }
    
    internal var factories = [AvailableDrink: JuiceDrinkFactory]()
    
    internal var namedFactories = [(String, JuiceDrinkFactory)]()
    
    init() {
        for drink in AvailableDrink.all {
            guard let type: AnyClass = NSClassFromString("DesignPatterns.\(drink.rawValue)Factory") else {
                return
            }
            let factory = (type as! JuiceDrinkFactory.Type).init()
            factories[drink] = factory
            
            namedFactories.append((drink.rawValue, factory))
        }
    }
    func availableDrinks() {
        print("Available drinks")
        for i in 0..<namedFactories.count
        {
            let tuple = namedFactories[i]
            print("\(i): \(tuple.0)")
        }
    }
    func makeDrink(input: Int) -> JuiceDrink {
        return namedFactories[input].1.prepare(amount: 250)
    }
}
