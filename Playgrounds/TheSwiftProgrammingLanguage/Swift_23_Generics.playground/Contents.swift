//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Generics //////////////////////////////

// ========= The Problem That Generics Solve =================

// A standard, non-generic function to swap the values of two `Int` variables
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
    
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// A standard, non-generic function to swap the values of two `String` variables
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// A standard, non-generic function to swap the values of two `Double` variables
func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}


// ======================== Generic Functions =====================

/**
 “The generic version of the function uses a placeholder type name (called T, in this case) instead of an actual type name (such as Int, String, or Double). The placeholder type name doesn’t say anything about what T must be, but it does say that both a and b must be of the same type T, whatever T represents. The actual type to use in place of T will be determined each time the swapTwoValues(_:_:) function is called.”
 

 “The other difference is that the generic function’s name (swapTwoValues(_:_:)) is followed by the placeholder type name (T) inside angle brackets (<T>). The brackets tell Swift that T is a placeholder type name within the swapTwoValues(_:_:) function definition. Because T is a placeholder, Swift does not look for an actual type called T.”
 
 摘录来自: Apple Inc. “The Swift Programming Language (Swift 3.1)”。 iBooks.
 */
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA

}

swapTwoValues(&someInt, &anotherInt)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)


// ======================== Type Parameters =====================

/*
 “Type parameters specify and name a placeholder type, and are written immediately after the function’s name, between a pair of matching angle brackets (such as <T>).”

“You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas.”

*/

func dictionary <Key, Value>(_ key: Key, _ value: Value) {
    
}


// =================== Naming Type Parameters ====================
/**
 “In most cases, type parameters have descriptive names, such as Key and Value in Dictionary<Key, Value> and Element in Array<Element>, which tells the reader about the relationship between the type parameter and the generic type or function it’s used in. However, when there isn’t a meaningful relationship between them, it’s traditional to name them using single letters such as T, U, and V, such as T in the swapTwoValues(_:_:) function above.”

摘录来自: Apple Inc. “The Swift Programming Language (Swift 3.1)”。 iBooks.
 
 */

// =================== Generic Types ====================

struct Stack<Element> {
    // use an `Array` property to store the values in the stack
    var items = [Element]()
    
    // push a value on the top of the stack.
    // we mark this method as `mutating`, because we need to modify(or mutate) the structure's `items` array.
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    // push: remove the top item in the stack
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
let fromTheTop = stackOfStrings.pop()


// ======================== Extending a Generic Type =====================
/**
 “Note that this extension does not define a type parameter list. Instead, the Stack type’s existing type parameter name, Element, is used within the extension to indicate the optional type of the topItem computed property.”
 
 */
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}


if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}

// ======================== Type Constraints =====================

/**

 “Any type that is Equatable can be used safely with the findIndex(of:in:) function, because it is guaranteed to support the equal to operator. To express this fact, you write a type constraint of Equatable as part of the type parameter’s definition when you define the function:”
 
*/
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(of: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

// ======================== Associated Types =====================

/**
 “This protocol doesn’t specify how the items in the container should be stored or what type they are allowed to be. The protocol only specifies the three bits of functionality that any type must provide in order to be considered a Container. A conforming type can provide additional functionality, as long as it satisfies these three requirements.”
 */
protocol Container {
    // “ Associated types are specified with the associatedtype keyword”
    associatedtype Item
    
    mutating func append(_ item: Item)
    var count: Int {
        get
    }
    subscript(i: Int) -> Item {
        get
    }
}

struct NewStack<Element>: Container {
    // original IntStack implementation
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    // conformance to the Container protocol
    
    // “The definition of typealias Item = Int turns the abstract type of Item into a concrete type of Int for this implementation of the Container protocol.”
    typealias Item = Element
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
    
}

/** “Extending an Existing Type to Specify an Associated Type” */

extension Array: Container {}

// ======================== Generic Where Clauses =====================

// “It can also be useful to define requirements for associated types. You do this by defining a generic where clause.”

/**
 “The following requirements are placed on the function’s two type parameters:
 
 C1 must conform to the Container protocol (written as C1: Container).
 C2 must also conform to the Container protocol (written as C2: Container).
 The Item for C1 must be the same as the Item for C2 (written as C1.Item == C2.Item).
 The Item for C1 must conform to the Equatable protocol (written as C1.Item: Equatable).
 The first and second requirements are defined in the function’s type parameter list, and the third and fourth requirements are defined in the function’s generic where clause.”
 */
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    
    // Check that both containers contain the same number of items.
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    // Check each pair of items to see if they are equivalent.
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    // All items match, so return true.
    return true
}

var newStackOfStrings = NewStack<String>()
newStackOfStrings.push("uno")
newStackOfStrings.push("dos")
newStackOfStrings.push("tres")

if allItemsMatch(newStackOfStrings, ["uno", "dos", "tres"]) {
    print("All items match.")
} else {
    print("Not all items match.")
}


// ======================== Extensions with a Generic Where Clause ====================

extension NewStack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        
        return topItem == item
    }
}


if newStackOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}


// “You can use a generic where clause with extensions to a protocol.”
extension Container where Item: Equatable {
    func startWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

if [9, 9, 9].startWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}

// “you can also write a generic where clauses that require Item to be a specific type.”
extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        
        return sum / Double(count)
    }
}

//print(["3", "45"].average())
print([123.3, 3434.45].average())
