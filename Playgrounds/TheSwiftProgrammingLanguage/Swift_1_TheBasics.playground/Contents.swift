//: Playground - noun: a place where people can play

import UIKit

///////////////////////////////////// The Basics ////////////////////////////////////

// ======================= Constants and Variables ==========================

//_________ Declaring Constants and Variables
let maximumNumberOfLoginAttempts = 10
//maximumNumberOfLoginAttempts = 5 // Note: The value of constant cannot be changed once it is set.

var currentLoginAttempt = 0
var x = 0.0, y = 0.0, z = 0.0

//____________  Type Annotations

// Note: It is rare that you need to write type annotations in practice.
var welcomeMessage: String
welcomeMessage = "Hello"
var red, green, blue: Double

//________________ Naming Constants and Variables

// Note: Constant and variable names can contain almost any character, including Unicode characters
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐂 = "dogcow"
var (`let`) = "typeNameOfConstantInSwift"

var friendlyWelcome = "hello"
friendlyWelcome = "Bonjour!"

//___________ Printing Constants and Variables

print(friendlyWelcome)

// By default, the function terminates the line it prints by adding a line break.
// To print a value without a line break after it, pass an empty string as the terminator.
print(friendlyWelcome + "1", terminator: "")
print(friendlyWelcome + "2", terminator: "")


print("The current value of friendlyWelcome is \(friendlyWelcome)")

// ======================= Comments ==========================

// This is a comment

/*  This is also a comment,
    but is written over multiple lines.
 */

/* This is the start of the first multiline comment. 
 
 /*
    This is the second, nested multiline comment.
 */
 
    This is the end of the first multiline comment.
 */

// ======================= Semicolons ==========================
let cat = "🐈";print(cat)

// ======================= Integers ==========================

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
print("minValue = \(minValue), maxValue = \(maxValue)")


// ======================= Floating-Point Numbers ==========================

let doubleValue = 3.1415
let floatValue: Float = 3.1415

// ================ Type Safety and Type Inference =========================

let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int 

let pi = 3.14159
// pi is inferred to be of type Double
// Type inference enables a compiler to deduce the type of a particular expression automatically when it compiles your code, simply by examining the values you provide.

let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double

//let numer = meaningOfLife + pi  // This will casue compile error.

// ======================= Numeric Literals ==========================

// Integer literals
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11
print("\(decimalInteger), \(binaryInteger), \(octalInteger), \(hexadecimalInteger)")

// Floating-point literals
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0


// Numeric literals can contain extra formatting to make them easier to read.
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// ======================= Numeric Type Conversion ==========================

// Integer Conversion
//let cannotBeNegative: UInt8 = -1  // UInt8 cannot store negative numbers, and so this will report an error
//let tooBig: Int8 = Int8.max + 1 // Int8 cannot store a number larger than its maximum value


// To convert one specific number type to another, you initialize a new number of the desired type with the existing value.
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


// Integer and Floating-Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let anotherPi_1 = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(anotherPi_1)

// ======================= Type Aliases ==========================

// Type aliases define an alternative name for an existing type.
typealias AudioSample = UInt16
var maxAmpltitudeFound = AudioSample.min


// ======================= Booleans ==========================

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips ar horrible.")
}


// Swift’s type safety prevents non-Boolean values from being substituted for Bool.
//let i = 1
//if i {
//    
//}

let i = 1
if i == 1 {
    print("This Ok for if-else")
}

// ======================= Tuples ==========================

// Tuples group multiple values into a single compound value. The values within a tuple can be of any type and do not have to be of the same type as each other.
// http404Error is of type (Int, String), and equals (404, "Not Found")
let http404Error = (404, "Not Found")

// You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:”
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")

print("The status message is \(statusMessage)")

// If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode))")


// Alternatively, access the individual element values in a tuple using index numbers starting at zero.
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// You can name the individual elements in a tuple when the tuple is defined:
let http200Status = (statusCode: 200, description: "OK")


// ======================= Optionals ==========================


let possibleNumber = "123"
//let convertedNumber = Int.init(possibleNumber)
let convertedNumber = Int(possibleNumber) // convertedNumber is inferred to be of type "Int?", or "optional Int

// You set an optional variable to a valueless state by assigning it the special value nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

// nil cannot be used with nonoptional constants and variables.
//var serverResponseCode = 404
//serverResponseCode = nil

// You can use an if statement to find out whether an optional contains a value by comparing the optional against nil.
if convertedNumber != nil {
    
    // Forced unwrapping of the optional's value
    print("convertedNumer has an integer value of \(convertedNumber!)")  // Once you’re sure that the optional does contain a value, you can access its underlying value by adding an exclamation mark (!) to the end of the optional’s name
}


// Optional binding
if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

// You can include as many optional bindings and Boolean conditions in a single if statement as you need to, separated by commas.
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\"\(firstNumber) < \(secondNumber) < 100")
}

// The following if statement is equal to the above if statement
if let firstNumber = Int("2") {
    if let secondNumber = Int("43") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\"\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// Implicitly Unwrapped Optionals
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optinal string."
let implicitString: String = assumedString // no need for an exclamation mark

// ======================= Error Handling ==========================

func canThrowAnError() throws {
    // this function may or may not throw an error
}


do {
    try canThrowAnError()
    
    // no error was thrown
} catch {
    // an error was thrown
}



enum SandwichError: Error {
    case outOfCleanDishes
    case missingIngredients(ingredients: Any)
}


func makeASandwich() throws {
    // ...
}

func eatASandwich() {
    
}

func washDishes() {
    
}

func buyGroceries(ingredients: Any) {
    
}

do {
    try makeASandwich()
    eatASandwich()
    
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients: ingredients)
}


// ======================= Assertions ==========================

let age = -3
//assert(age > 0, "A person's age cannot be less than zero")


