//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Nishant Sharma on 5/11/19.
//  Copyright © 2019 Nishant Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Builder
        let cb = CodeBuilder("Employee").addField(called: "name", ofType: "String").addField(called: "Age", ofType: "Int")
        print(cb.description)
        
        //Builder
        let pb = PersonBuilder()
        let p = pb
            .lives.at("B 201, The Imperial Building").inCity("Hyderabad").withPostcode("500080")
            .works.at("Imaginary Company").asA("Project Manager").earning(123000)
            .build();
        print(p)
        
        //Abstract factory
        let machine = JuiceDrinkMachine()
        print(machine.namedFactories.count)
        machine.availableDrinks()
        let drink = machine.makeDrink(input: 0)
        drink.consume()
        
        //Factory
        let employeeFactory = EmployeeFactory.init()
        let uday = employeeFactory.createEmployee(name: "Uday")
        let viru = employeeFactory.createEmployee(name: "Viru")
        print(uday.id, uday.name, viru.id, viru.name)
       
        //Prototype
        let line = Line.init(start: Point(x: 0, y: 0), end: Point(x: 10, y: 10))
        let deepLine = Line.deepCopy(line)
        print(line.start.x,line.start.y,line.end.x,line.end.y)
        print(deepLine().start.x,deepLine().start.y,deepLine().end.x,deepLine().end.y)
       
        //Singelton
        let singletonDB = SingletonDatabase.instance
        print(singletonDB.capitals)
        print(singletonDB.getPopulation(name: "gamma"))
        
        //Adapter
        draw()
        
        let sq = Square(side: 11)
        let adapter = SquareToRectangleAdapter(sq)
        print(121, adapter.area)

        let raster = RasterRenderer()
        let vector = VectorRenderer()
        let circle1 = Circle(vector, 5)
        let circle2 = Circle(raster, 5)
        circle1.draw()
        circle1.resize(2)
        circle1.draw()
        circle2.draw()
        circle2.resize(2)
        circle2.draw()
        //Bridge
        print(VectorRender().whatToRenderAs)
        print(Squares(VectorRender()))
        
        //Composite
        let neuron1 = Neuron()
        let neuron2 = Neuron()
        let layer1 = NeuronLayer(count: 10)
        let layer2 = NeuronLayer(count: 20)
        
        neuron1.connectTo(neuron2)
        neuron1.connectTo(layer1)
        layer2.connectTo(neuron1)
        layer1.connectTo(layer2)
        
        //Decorator
        let dragon = Dragon()
        print(dragon.fly())
        print(dragon.crawl())
        dragon.age = 20
        print(dragon.fly())
        
        //Facade
        let c = Console()
        let u = c.getCharacterAt(1)
        print(u)
        
        //Flyweight
        let s = Sentence("alpha beta gamma")
        s[1].capitalize = true
        print(s.description)
        
        //Proxy
        let lazyP = LazyPerson()
        lazyP.age = 10
        let rp = ResponsiblePerson(person: lazyP)
        print(rp.drive())
        print(rp.drink())
        
        //Command
        let a = Account()
        
        let deposit = Command(.deposit, 100)
        a.process(deposit)
        print(a.balance)

        //Mediator
        let mediator = Mediator()
        let p1 = Participant(mediator)
        let p2 = Participant(mediator)
        
        print(p1.value)
        print(p2.value)

        //Memento
        let ba = BankAccount(100)
        let m1 = ba.deposit(50) // 150
        let m2 = ba.deposit(25) // 175
        print(ba)
        
        // restore to m1
        ba.restore(m1)
        print(ba)
        
        // restore to m1
        ba.restore(m2)
        print(ba)
        
        //TemplateMethod
        
        let c1 = Creature(1, 2)
        let c2 = Creature(1, 3)
        let game = PermanentCardDamage([c1, c2])
        print(game.combat(0, 1))
        print(game.combat(1, 0))
        
        //State
        statePattern()
    }
    func statePattern()
    {
        var state = State.offHook // starting state
        while true
        {
            print("The phone is currently \(state)")
            print("Select a trigger:")
            
            for i in 0..<rules[state]!.count
            {
                let (t, _) = rules[state]![i]
                print("\(i). \(t)")
            }
            
            if let input = Int(readLine() ?? "0")
            {
                let (_, s) = rules[state]![input]
                state = s
            }
        }
    }
    
    func draw()
    {
        let vectorObjects = [
            VectorRectangle(1,1,10,10),
            VectorRectangle(3,3,6,6)
        ]
        for vo in vectorObjects
        {
            for line in vo
            {
                let adapter = LineToPointAdapter(line)
                adapter.forEach{ drawPoint($0) }
            }
        }
    }

}




