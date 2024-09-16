//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


import Foundation

enum Fuel {
    case petrol
    case diesel
    case gas
}

protocol Engine {
    func startEngine()
}

class SingleCylinderEngine: Engine {
    func startEngine() {
        print("Single Cylinder Engine Starting ...")
    }
}

class V8Engine: Engine {
    func startEngine() {
        print("V8 Engine Starting ...")
    }
}

protocol VehicleProtocol {
    var name: String { get set }
    var color: String { get set }
    
    func speak()
}

class VehicleWithMachine: VehicleProtocol {
    public var fuel: Fuel
    public var engine: Engine
    public var name: String
    public var color: String
    
    init(name: String, color: String, fuel: Fuel, engine: Engine) {
        self.name = name
        self.color = color
        self.fuel = fuel
        self.engine = engine
    }
    
    func speak() {
        print("I am a machined vehicle")
    }
    
    func startEngine() {
        engine.startEngine()
    }
}

class ManualVehicle: VehicleProtocol {
    public var name: String
    public var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    func speak() {
        print("I am a manual vehicle.")
    }
}

class Vehicle {
    private var vehicle: VehicleProtocol
    
//    var name: String {
//        get { vehicle.name }
//        set { vehicle.name = newValue }
//    }
//    
//    var color: String {
//        get { vehicle.color }
//        set { vehicle.color = newValue }
//    }
//    
    init(vehicle: VehicleProtocol) {
        self.vehicle = vehicle
    }
    
    func moveForward() {
        print("Moving forward...")
    }
    
    func moveBackward() {
        print("Moving backward...")
    }
    
    func speak() {
        vehicle.speak()
    }
}

var manualVehicle = ManualVehicle(name: "Bicycle", color: "Red")
var vh = Vehicle(vehicle: manualVehicle)
vh.speak()

var machinedVehicle = VehicleWithMachine(name: "Car", color: "Blue", fuel: .petrol, engine: V8Engine())
var vh2 = Vehicle(vehicle: machinedVehicle)
vh2.speak()

extension Vehicle {
    func changeGear() {
        print("Gear changing...")
    }
}


vh.changeGear()
vh2.changeGear()
