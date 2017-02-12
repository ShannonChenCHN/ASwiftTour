//: Playground - noun: a place where people can play

import UIKit

// Infrring types
var str = "Hello, playground"
str = "hello, Swift"
let constStr = str

// Specifying types

// Numbers and Boolean types
var nextYear: Int
var bodytemp: Float
var hasPet: Bool

// Collection types
var arrayOfInts: Array<Int>
var intArray: [Int]
var dictionaryOfCapitalsByCountry: Dictionary<String, String>
var mapperOfCapitalsByCountry: [String : String]
var winningLotteryNumbers: Set<Int>


// Literals and subscripting
let number = 42
let fmStation = 91.1
var countingUp = ["one", "two"]
let secondElement = countingUp[1]
let nameByParkingSpacing = [13: "Alice", 27: "Bob"]
let valueBy13 = nameByParkingSpacing[13]

// Initializers
let emptyString = String()
let emptyArrayofInts = [Int]()
let emptyDictionary = [String: String]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let meaningOfLife = String(42)
let availableRooms = Set([205, 411, 412])

let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi: Float = 3.14

// Properties
countingUp.count
emptyString.isEmpty
countingUp.isEmpty

// Instance methods
countingUp.append("three")

// Optional
var anOptionalFloat: Float?
var anOptionalArrayOfStrings: [String]?
var anOptionalArrayOfOptionalStrings: [String?]?

var reading1: Float?
var reading2: Float?
var reading3: Float? // 后面不加问号会怎么样？

reading1 = 9.8
reading2 = 9.2
// reading3 = 9.7 // comment to make reading3 stay nil

// 1. Unwrapping an optional variable by forced unwrapping
// let avgReading = (reading1! + reading2! + reading3!) / 3

// 2. Unwrapping an optional variable by optional binding
if let r1 = reading1, let r2 = reading2, let r3 = reading3 {
    let avgReading = (r1 + r2 + r3) / 3
}
else {
    let errorString = "Instrument reported a reading that was nil"
}

// Subscripting dictionaries
let space13Assignee: String? = nameByParkingSpacing[13]
let space42Assignee: String? = nameByParkingSpacing[42]
if let space13Assignee = nameByParkingSpacing[13] {
    print("Key 13 - \(space13Assignee) is assigned in the dictionary!")
}

// Loops and String Interpolation
let range = 0..<countingUp.count
for i in range {
    let string = countingUp[i]
    print(string + "\n")
}

for string in countingUp {
    print(string + "\n")
}

for (i, string) in countingUp.enumerated() {
    
}

for (space, name) in nameByParkingSpacing {
    let permit = "Space \(space): \(name)"
}

// Enumerations and the Swich Statement
enum PieType: String {
    case apple = "Apple"
    case cherry
    case pecan
}

let favoritePie = PieType.apple
let name: String
switch favoritePie {
case .apple:
    name = "Apple"
case .cherry:
    name = "Cherry"
case .pecan:
    name = "Pecan"
}
print(name)



let macOSVersion = 9
switch macOSVersion {
case 0...8:
    print("A big cat")
case 9:
    print("Mavericks")
case 10:
    print("Yosemite")
case 11:
    print("El Capitan")
case 12:
    print("Sierra")
default:
    print("Greetings, people of the future!")
}


let pieRawValue = PieType.pecan.rawValue

