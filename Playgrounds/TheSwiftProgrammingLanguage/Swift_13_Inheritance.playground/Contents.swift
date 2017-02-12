//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Inheritance //////////////////////////////

// ==================== Defining a Base Class ===========================

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed)"
    }
    
    
    func makeNoise() {
        // do nothing
    }
    
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")


// ==================== Subclassing ===========================


class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")





// ==================== Overriding ===========================



class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    
    // Overriding Property Getters and Setters
    final override var description: String {
        return super.description + " in gear \(gear)"
    }
    
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")



class AutomicCar: Car {
    
    // Overriding Property Observers
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
    // cannot override a `final` var
//    override var description: String {
//        return super.description + " in gear \(gear)"
//    }
    
}

let automatic = AutomicCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

// ==================== Preventing Overrides ===========================





