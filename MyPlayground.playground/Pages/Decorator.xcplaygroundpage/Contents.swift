//: [Previous](@previous)

import Foundation

//The Decorator Pattern is a structural design pattern that allows behavior to be added to individual objects, dynamically, without affecting the behavior of other objects from the same class. The pattern provides a flexible alternative to subclassing for extending functionality.


//Imagine you're at a coffee shop. You can order a base coffee, such as an Espresso, and then add various options (decorations) like milk, sugar, or whipped cream to it. Each addition decorates the base coffee with new functionality or properties (like flavor or cost).


// Step 1: Define the base interface (Component)
protocol Coffee {
    func cost() -> Double
    func description() -> String
}

// Step 2: Implement a base concrete class (Concrete Component)
class Espresso: Coffee {
    func cost() -> Double {
        return 2.0 // Base price of Espresso
    }
    
    func description() -> String {
        return "Espresso"
    }
}

// Step 3: Create a base decorator class (Decorator)
class CoffeeDecorator: Coffee {
    private let decoratedCoffee: Coffee
    
    init(decoratedCoffee: Coffee) {
        self.decoratedCoffee = decoratedCoffee
    }
    
    func cost() -> Double {
        return decoratedCoffee.cost() // Delegates the cost calculation
    }
    
    func description() -> String {
        return decoratedCoffee.description() // Delegates the description
    }
}

// Step 4: Implement concrete decorators (Concrete Decorators)
class Milk: CoffeeDecorator {
    override func cost() -> Double {
        return super.cost() + 0.5 // Adds milk cost
    }
    
    override func description() -> String {
        return super.description() + ", Milk"
    }
}

class Sugar: CoffeeDecorator {
    override func cost() -> Double {
        return super.cost() + 0.2 // Adds sugar cost
    }
    
    override func description() -> String {
        return super.description() + ", Sugar"
    }
}

class WhippedCream: CoffeeDecorator {
    override func cost() -> Double {
        return super.cost() + 0.7 // Adds whipped cream cost
    }
    
    override func description() -> String {
        return super.description() + ", Whipped Cream"
    }
}

// Step 5: Client code to use decorators
let espresso = Espresso()
print("\(espresso.description()): $\(espresso.cost())")

let espressoWithMilk = Milk(decoratedCoffee: espresso)
print("\(espressoWithMilk.description()): $\(espressoWithMilk.cost())")

let espressoWithMilkAndSugar = Sugar(decoratedCoffee: espressoWithMilk)
print("\(espressoWithMilkAndSugar.description()): $\(espressoWithMilkAndSugar.cost())")

let fancyCoffee = WhippedCream(decoratedCoffee: espressoWithMilkAndSugar)
print("\(fancyCoffee.description()): $\(fancyCoffee.cost())")


print("\(espresso.description()): $\(espresso.cost())")
