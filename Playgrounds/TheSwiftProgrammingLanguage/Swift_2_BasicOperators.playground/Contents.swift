//: Playground - noun: a place where people can play

import UIKit

///////////////////////////////////// Basic Operatiors ////////////////////////////////////

// ======================= Terminology ==========================

// Unary operator
let negtiveInteger = -1

// Binary operator
let positiveInteger = 2 + 3

// Ternary operator
let ternary = positiveInteger > 0 ? 1 : 0

// ======================= Assignment Operator ==========================

let b = 10
var a = 5
a = b

// This is not valid, because x =y does not return a value.
//if a = b {
//    
//}

// ======================= Arithmetic Operators ==========================

let combinedString = "Hello" + "world"

// ======================= Compound Assignment Operators ==========================

var num = 1
num += 2

// ======================= Comparison Operators ==========================

let name = "world"
if name == "world" {
    print("name is \(name)")
}

//  Swift also provides two identity operators (=== and !==), which you use to test whether two object references both refer to the same object instance.
let object: NSString = "NSString"
let anotherObject = object

if object === anotherObject {
    print("object and anotherObject both refer to the same object instance.")
    
}

// ================ Ternary Conditional Operator =========================


let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// ======================= Nil-Coalescing Operator ==========================

let defaultColorName = "red"
var userDefinedColorName: String? // defaults to nil

// The following two statement are equal
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
var colorNameToUser = userDefinedColorName ?? defaultColorName
var colorName = userDefinedColorName != nil ? userDefinedColorName : defaultColorName


// ======================= Range Operators ==========================


for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("person \(i + 1) is called \(names[i])")
}

// ======================= Logical Operators ==========================

let enteredDoorCode = true
let passedRetinaScan = false
let hasDoorKey = true
let knowsOverridePassword = false

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
