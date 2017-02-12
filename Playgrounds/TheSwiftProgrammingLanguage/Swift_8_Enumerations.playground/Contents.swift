//: Playground - noun: a place where people can play

import UIKit

////////////////////////////////////  Enumerations ////////////////////////////////////

// ================================ Enumeration Syntax ================================

// The value defined in an enumeration are its emumeration cases. 
// You use the `case` keyword to introduce new enumeration cases.
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// multiple cases can appear on a single line, separated by commas
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west

directionToHead = .east

// ================ Matching Enumeration Values with a Switch Statement ==========

directionToHead = .south

switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
    
}

let somePlanet = Planet.earth

switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// ========================= Associated Values ============================

enum BarCode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarCode = BarCode.upc(8, 85909, 51226, 3)
productBarCode = BarCode.qrCode("ABCDEFGHIJKLMNOP")

switch productBarCode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}


switch productBarCode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}

// ============================= Raw Values ===============================
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case linFeed = "\n"
    case carriageReturn = "\r"
}

enum RawPlanet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}


enum RawCompassPoint: String {
    case north, south, east, west  // north has an implicit raw value of "north", and so on.
}

let earthsOrder = RawPlanet.earth.rawValue
let sunsetDirection = RawCompassPoint.west.rawValue


let possiblePlanet = RawPlanet(rawValue: 7)

let positionToFind = 11
if let somePlanet = RawPlanet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


// ========================= Recursive Enumerations ============================

//enum ArithmeticExpression {
//    case number(Int)
//    indirect case addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    
    }
}

print(evaluate(product))



