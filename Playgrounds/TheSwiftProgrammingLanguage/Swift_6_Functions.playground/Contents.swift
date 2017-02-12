//: Playground - noun: a place where people can play

import UIKit

///////////////////////////////////// Functions ////////////////////////////////////

// ======================= Defining and Calling Functions ==========================

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))


func greetAgain(person: String) -> String {
    return "Hello again," + person + "!"
}

print(greetAgain(person: "Anna"))

// ======================= Function Without Parameters ==========================
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())


// ====================== Functions With Multiple Parameters =================
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))


// ============= Functions Without Return Values ===========

func greet(person: String) {
    print("Hello, \(person)!")
}

greet(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")




// ============= Functions with Multiple Return Values ===========
// ============= Optional Tuple Return Types ===========

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 522]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// ================== Function Argument Labels and Parameter Names ====================

func someFunction(argumentLabel firstParameterName: Int, _ secondParameterName: Int) {
    
}

// ======================= Default Parameter Values ==========================

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
    
    print("\(parameterWithDefault + parameterWithoutDefault)")
}

someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)


//  ======================== Variadic Parameters  ============================

// Only a single variadic parameter '...' is permmited
func arthmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}

arthmeticMean(1, 2, 3, 4, 5)
arthmeticMean(3, 3.5, 75.3)


// ========================= In-Out parameters ================================

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
    
}

var someInt = 3
var anotherInt = 107


swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


// ============================ Function Types ====================================

// type: (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

// type: (Int, Int) -> Int
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// type: () -> Void
func printHelloWorld() {
    print("hello, world")
}

// ================================ Using Function Types ================================

// Define a variable called mathFunction, which has a type of 'a function that takes two Int values, and return an Int value.' Set this new variable to refer to the function called addTwoInts.
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

let anotherFunction = addTwoInts


/// Function Type as return Types
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseSetFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseSetFunction(backward: currentValue > 0)
print("Counting to zero")

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}

print("zero!")

// ================================ Nested Functions ================================

func chooseNestedStepFunction(backward: Bool) -> (Int) -> Int {
    var n = 1
    func nestedStepForward(_ input: Int) -> Int {
        n += 1
        print("n1 = \(n)")
        return input + 1
    }
    
    func nestedStepBackward(_ input: Int) -> Int {
        return input - 1
    }
    print("n2 = \(n)")
    return backward ? nestedStepBackward : nestedStepForward
}

var currentValue2 = -4
let moveNearerToZero2 = chooseNestedStepFunction(backward: currentValue2 > 0)
print("Counting to zero")

while currentValue2 != 0 {
    print("\(currentValue2)...")
    currentValue2 = moveNearerToZero2(currentValue2)
}

print("zero!")



