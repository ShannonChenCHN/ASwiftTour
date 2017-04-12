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

let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double

//let numer = meaningOfLife + pi  // This will casue compile error.

// ======================= Numeric Literals ==========================

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11
print("\(decimalInteger), \(binaryInteger), \(octalInteger), \(hexadecimalInteger)")

// ======================= Numeric Type Conversion ==========================


// ======================= Type Aliases ==========================

// ======================= Booleans ==========================

// ======================= Tuples ==========================

// ======================= Optionals ==========================


// ======================= Error Handling ==========================

// ======================= Assertions ==========================
