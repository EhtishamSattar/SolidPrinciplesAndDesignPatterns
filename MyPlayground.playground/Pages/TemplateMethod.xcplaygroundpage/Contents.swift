//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//The Template Method Pattern is a behavioral design pattern that defines the skeleton of an algorithm in a base class but lets subclasses override specific steps of the algorithm without changing its structure. This pattern promotes code reuse and helps enforce a common sequence of operations while allowing flexibility in specific steps.


// Step 1: Define an abstract base class (Template)
class Dish {
    
    // Template method
///    The prepareRecipe() method is declared as final to prevent subclasses from overriding it. This ensures that the overall structure of the algorithm, which is defined in the prepareRecipe() method, remains unchanged.
    ///
    ///
    
    final func prepareRecipe() {
        prepareIngredients()
        cook()
        serve()
    }
    
    // Steps that will have different implementations in subclasses
    func prepareIngredients() {
        fatalError("Subclasses must override prepareIngredients()")
    }
    
    func cook() {
        fatalError("Subclasses must override cook()")
    }
    
    // Common step
    func serve() {
        print("Serving the dish...")
    }
}

// Step 2: Define concrete subclasses that implement the specific steps
class Pasta: Dish {
    override func prepareIngredients() {
        print("Preparing pasta, tomato sauce, and vegetables.")
    }
    
    override func cook() {
        print("Cooking pasta and simmering sauce.")
    }
}

class Salad: Dish {
    override func prepareIngredients() {
        print("Chopping lettuce, tomatoes, cucumbers, and preparing dressing.")
    }
    
    override func cook() {
        print("Mixing salad ingredients and dressing.")
    }
}

// Step 3: Client code
let pastaDish = Pasta()
pastaDish.prepareRecipe()
// Output:
// Preparing pasta, tomato sauce, and vegetables.
// Cooking pasta and simmering sauce.
// Serving the dish...

let saladDish = Salad()
saladDish.prepareRecipe()
// Output:
// Chopping lettuce, tomatoes, cucumbers, and preparing dressing.
// Mixing salad ingredients and dressing.
// Serving the dish...
