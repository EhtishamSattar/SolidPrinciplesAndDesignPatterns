import UIKit

//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

print("https://github.com/KenanAtmaca/Design-Patterns-Swift/blob/master/Creational/Builder.swift")

class House {
    var walls: String?
    var doors: String?
    var windows: String?
    var roof: String?
    var garage: Bool = false

    func showDetails() {
        print("""
        House Details:
        - Walls: \(walls ?? "N/A")
        - Doors: \(doors ?? "N/A")
        - Windows: \(windows ?? "N/A")
        - Roof: \(roof ?? "N/A")
        - Garage: \(garage ? "Yes" : "No")
        """)
    }
}


protocol HouseBuilder {
    var house: House { get }
    
    func buildWalls()
    func buildDoors()
    func buildWindows()
    func buildRoof()
    func addGarage()
}

class WoodenHouseBuilder: HouseBuilder {
    var house = House()
    
    func buildWalls() {
        house.walls = "Wooden Walls"
    }
    
    func buildDoors() {
        house.doors = "Wooden Doors"
    }
    
    func buildWindows() {
        house.windows = "Single Pane Windows"
    }
    
    func buildRoof() {
        house.roof = "Shingle Roof"
    }
    
    func addGarage() {
        house.garage = true
    }
}

class BrickHouseBuilder: HouseBuilder {
    var house = House()
    
    func buildWalls() {
        house.walls = "Brick Walls"
    }
    
    func buildDoors() {
        house.doors = "Metal Doors"
    }
    
    func buildWindows() {
        house.windows = "Double Pane Windows"
    }
    
    func buildRoof() {
        house.roof = "Concrete Roof"
    }
    
    func addGarage() {
        house.garage = false
    }
}

class ConstructionDirector {
    private var builder: HouseBuilder
    
    init(builder: HouseBuilder) {
        self.builder = builder
    }
    
    func constructHouse() -> House {
        builder.buildWalls()
        builder.buildDoors()
        builder.buildWindows()
        builder.buildRoof()
        builder.addGarage()
        return builder.house
    }
}


class ConstructionDirector {
    private var builder: HouseBuilder
    
    init(builder: HouseBuilder) {
        self.builder = builder
    }
    
    func constructHouse() -> House {
        builder.buildWalls()
        builder.buildDoors()
        builder.buildWindows()
        builder.buildRoof()
        builder.addGarage()
        return builder.house
    }
}


// Client code
let woodenHouseBuilder = WoodenHouseBuilder()
let brickHouseBuilder = BrickHouseBuilder()

let director = ConstructionDirector(builder: woodenHouseBuilder)
let woodenHouse = director.constructHouse()
woodenHouse.showDetails()

// Output:
// House Details:
// - Walls: Wooden Walls
// - Doors: Wooden Doors
// - Windows: Single Pane Windows
// - Roof: Shingle Roof
// - Garage: Yes

let anotherDirector = ConstructionDirector(builder: brickHouseBuilder)
let brickHouse = anotherDirector.constructHouse()
brickHouse.showDetails()

// Output:
// House Details:
// - Walls: Brick Walls
// - Doors: Metal Doors
// - Windows: Double Pane Windows
// - Roof: Concrete Roof
// - Garage: No



protocol Object {
    var width:Double? {get set}
    var height:Double? {get set}
    var color:String? {get set}
}

// ObjectBuilder and Object is different , ObjectBuilder ia having an Instance of Object
protocol ObjectBuilder {
    
    var object:Object {get set}
    
    func setWidth(width:Double?)
    func setHeight(height:Double?)
    func setColor(color:String?)
}

class Table: Object {
    
    var width: Double?
    var height: Double?
    var color: String?
    
}

// BuIlder Conforming to ObjectBuilder Protcol , it is necessary for Builder to defined and implement the var and method of ObjectBuilder
class Builder: ObjectBuilder {
    
    var object: Object
    
    init(_ object:Object) {
        self.object = object
    }

    func setWidth(width: Double?) {
        object.width = width
    }
    
    func setHeight(height: Double?) {
        object.height = height
    }
    
    func setColor(color: String?) {
        object.color = color
    }
    
}

class Creator {
    
    var builder: ObjectBuilder
    
    init(_ builder: ObjectBuilder) {
        self.builder = builder
    }
    
    func build(width:Double?,height:Double?,color:String?) {
        builder.setWidth(width: width)
        builder.setHeight(height: height)
        builder.setColor(color: color)
    }
    
}


let builder = Builder(Table())
let creator = Creator(builder)

creator.build(width: 200, height: 200, color: nil)
print(creator.builder.object.width!) // 200
