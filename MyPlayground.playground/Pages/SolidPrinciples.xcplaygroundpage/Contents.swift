import Foundation

//MARK: Dependency Inversion Principle
protocol Requirement {
    func getParking()
    func getGarden()
    func getCricketNet()
}

//MARK: Interface Segregation
//Interface Segregation for the sepcific Requirement of each house

protocol HaveGarden {
    func playinGarden()
}

protocol HaveParking {
    func parking(){
        print("Men will park their vehicle in parking")
    }
}

protocol HaveCricketNet {
    func playing(){
        print("Boys will play in net")
    }
}



// DoorBuilder and WindowBuilder are implementing on this Protocol
protocol Builder {
    func build()
}

// House is dependent on the protocol(Abstraction) that defines the blueprint for Door and Wood Builder
class House : HaveGarden {
    var name: String
    var builder: Builder
    
    init(name: String, builder: Builder) {
        self.name = name
        self.builder = builder
    }
    
    func playinGarden(){
        print("Family will enjoy the greenery of Garden")
    }
    
    
}

class DoorBuilder: Builder {
    func build() {
        print("I am a door builder building doors...")
    }
}

class WindowBuilder: Builder {
    func build() {
        print("I am a window builder building windows...")
    }
}

var doorBuilder = DoorBuilder()
var house = House(name: "Business Man's House", builder: doorBuilder)
house.builder.build()




//MARK: Single Responsibility Principle
class BillGenerator {
    func calculateBill(for house: House) {
        print("Calculating bill for house: \(house.name)")
    }
}




//MARK:  Open/Closed Principle
extension BillGenerator {
    func applyDiscountOnBillRange() {
        print("Applying discounts on bills above 40k")
    }
}



// Conforming to HaveParking Protocol (Interface Segregation)
class MarlaHouse: House , HaveParking {
    init(builder: Builder) {
        super.init(name: "10 Marla House", builder: builder)
    }
    
    func parking(){
        print("Men will park their vehicle in parking")
    }
}


var marlaHouse = MarlaHouse(builder: WindowBuilder())

var billCalculator = BillGenerator()

// MARK: Liskov substitution principle
billCalculator.calculateBill(for: marlaHouse)
billCalculator.applyDiscountOnBillRange()

