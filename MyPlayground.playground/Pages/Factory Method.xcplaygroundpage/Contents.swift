//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//Factory Method is a creational design pattern that is aimed to hide the creation logic of an object. Also the pattern is very useful when we don't know in advance which type of an object we are going to use. Factory Method pattern is relatevely easy to implement.

enum Engine {
    case v8
    case v2
    case v12
    case cylinderEngine
}

enum Price {
    case expensive
    case affordable
    case cheap
}
protocol Car {
    var name: String { get }
    var engine: Engine { get }
    var price: Price { get }
}

struct Bugaggi: Car {
    var name: String = "Buggagi Chevron"
    var engine: Engine = .v12
    var price: Price = .expensive
}

struct Fodr: Car {
    var name: String = "Fodr Pahamareno"
    var engine: Engine = .v8
    var price: Price = .affordable
}

struct Truck: Car {
    var name: String = "Truck Trashmobile"
    var engine: Engine = .v2
    var price: Price = .cheap
}

class CarFactory {
    
    func produce(price: Price) -> Car {
        switch price {
        case .expensive:
            return Bugaggi()
        case .affordable:
            return Fodr()
        case .cheap:
            return Truck()
        }
    }
}

// Create the factory
let carFactory = CarFactory()
// Produce the concrete car for expencive price tier:
let expensivePowerfulCar = carFactory.produce(price: .expensive)
// The produced car is Bugaggi

// Next produce car for cheap price tier
let cheapAndNotPoweful = carFactory.produce(price: .cheap)
// The produced car is Truck
