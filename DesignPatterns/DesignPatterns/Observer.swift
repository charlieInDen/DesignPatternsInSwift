//
//  Observer.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import Foundation

protocol Invocables : class
{
    func invoke(_ data: Any)
}

public protocol Disposables
{
    func dispose()
}

public class Events<T>
{
    public typealias EventHandler = (T) -> ()
    
    var eventHandlers = [Invocables]()
    
    public func raise(_ data: T)
    {
        for handler in self.eventHandlers
        {
            handler.invoke(data)
        }
    }
    
    public func addHandler<U: AnyObject>
        (target: U, handler: @escaping (U) -> EventHandler) -> Disposables
    {
        let subscription = Subscriptions(target: target, handler: handler, event: self)
        eventHandlers.append(subscription)
        return subscription
    }
}

class Subscriptions<T: AnyObject, U> : Invocables, Disposables
{
    weak var target: T?
    let handler: (T) -> (U) -> ()
    let event: Events<U>
    
    init(target: T?, handler: @escaping (T) -> (U) -> (), event: Events<U>)
    {
        self.target = target
        self.handler = handler
        self.event = event
    }
    
    func invoke(_ data: Any) {
        if let t = target {
            handler(t)(data as! U)
        }
    }
    
    func dispose()
    {
        event.eventHandlers = event.eventHandlers.filter { $0 as AnyObject? !== self }
    }
}

class Game
{
    var ratEnters = Events<AnyObject>()
    var ratDies   = Events<AnyObject>()
    var notifyRat = Events<(AnyObject,Rat)>()
    
    func fireRatEnters(_ sender: AnyObject)
    {
        ratEnters.raise(sender)
    }
    
    func fireRatDies(_ sender: AnyObject)
    {
        ratDies.raise(sender)
    }
    
    func fireNotifyRat(_ sender: AnyObject, _ whichRat: Rat)
    {
        notifyRat.raise((sender, whichRat))
    }
}

class Rat
{
    private let game: Game
    var attack = 1
    
    init(_ game: Game)
    {
        self.game = game
        
        _ = game.ratEnters.addHandler(
            target: self,
            handler: {
                (_) -> ((AnyObject)) -> () in
                return {
                    if $0 !== self
                    {
                        self.attack += 1
                        game.fireNotifyRat(self, $0 as! Rat)
                    }
                }
        }
        )
        
       _ = game.ratDies.addHandler(
            target: self,
            handler: {
                (_) -> ((AnyObject)) -> () in
                return {
                    if $0 !== self
                    {
                        self.attack -= 1
                    }
                }
        }
        )
        
        _ = game.notifyRat.addHandler(
            target: self,
            handler: {
                (_) -> ((AnyObject, Rat)) -> () in
                return {_ in
                    self.attack += 1
                }
        }
        )
        
        game.fireRatEnters(self)
    }
    
    func kill() {
        game.fireRatDies(self)
    }
}
