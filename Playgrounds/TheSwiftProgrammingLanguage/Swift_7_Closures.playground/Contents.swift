//: Playground - noun: a place where people can play

import UIKit

////////////////////////////////////  Closures ////////////////////////////////////

// ================================ Closure Expressions ================================

let names = ["Chris", "Alex", "Ewa", "Barry", "Daneilla"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2;
}

var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })

reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})

reversedNames = names.sorted(by: {$0 > $1})

// using a trailing closure
reversedNames = names.sorted() { $0 > $1 }

// If a closure expression is provided as the function or method’s only argument 
// and you provide that expression as a trailing closure, you do not need to write 
// a pair of parentheses () after the function or method’s name when you call the function
reversedNames = names.sorted { $0 > $1 }

reversedNames = names.sorted(by: >)


// ================================ Trailing Closures  ================================
func somefunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
    
}

// Here's how you call this function without using a trailing closure:
somefunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:
somefunctionThatTakesAClosure { 
    // closure's body goes here
}

let digitNames = [
    0: "Zero",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine"
]

let numbers = [16, 58, 510]
let  strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output  // get last digit name and combine them
        number /= 10
    } while number > 0
    
    return output
}


// ================== Capturing Values =========================

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incremnter() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incremnter
}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen() // returns a value of 10
incrementByTen() // returns a value of 20
incrementByTen() // returns a value of 30


let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven() // returns a value of 7

incrementByTen()  // returns a value of 40, does not affect the variable captured by incrementBySeven



// ================== Closures Are Reference Types  =========================

let alsoIncremntByTen = incrementByTen
alsoIncremntByTen() // returns a value of 50


// ================== Escaping Closures  =========================
var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler) // the closure passed in need to be called after the function returns, so this is an escaping closure.
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure() // the closure is called within the function, so this is a nonescaping closure.
}


class SomeClass {
    var x = 10
    
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100 // this is an escaping closure, so we have to refer to self explicitly.
        }
        
        someFunctionWithNonescapingClosure {
            x = 200 // this a nonescaping closure, so we can refer to self implicitly
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)



// ================== Autoclosures  =========================
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())")

print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
    print(customersInLine.count)
}

serve(customer: { customersInLine.remove(at: 0) })



func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
    print(customersInLine.count)
}

serve(customer: customersInLine.remove(at: 0))


// An autoclosure is a closure that is automatically created to wrap an expression
// that’s being passed as an argument to a function. 【It doesn’t take any arguments】,
// and when it’s called, 【it returns the value of the expression that’s wrapped inside of it】.


var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}



