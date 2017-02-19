//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Extensions //////////////////////////////

// ========= Extension Syntax =================

struct SomeStruct {
    
}

protocol SomeProtocol {
    
}

protocol AnotherProtocol {
    
}

// An extension can extend an existing type to make it adopt one or more protocols
extension SomeStruct: SomeProtocol, AnotherProtocol {
    // implementation of protocol requirements goes here
}


// ======================== Computed Properties =====================

// Extensions can add computed instance properties and computed type properties to existing types.
extension Double {
    var km: Double {
        return self * 1_000.0
    }
    
    var m: Double {
        return self
    }
    
    var cm: Double {
        return self / 100.0
    }
    
    var mm: Double {
        return self / 1_000.0
    }
    
    var ft: Double {
        return self / 3.28084
    }
    
}

//extension Double {
//
//    var km: Double {  // redclaration is not prohibited
//        return self * 1_000.0
//    }
//    
//}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

let oneKilometer = 1.km
print("One kilometer is \(oneKilometer) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")


// ======================== Initializers =====================

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
}

let defaultRect = Rect()
let memberwiseRect = Rect.init(origin: Point.init(x: 2.0, y: 2.0),
                               size: Size.init(width: 5.0, height: 5.0))

// extend the Rect structure to provide an additional initializer that takes a specific center point and size:
extension Rect {
    
    // Extensions can add new convenience initializers to a class, but they cannot add new designated initializers or deinitializers to a class. Designated initializers and deinitializers must always be provided by the original class implementation.
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        self.init(origin: Point.init(x: originX, y: originY),
                  size: size)
        
    }
}

let centerRect = Rect.init(center: Point.init(x: 4.0, y: 4.0),
                           size: Size.init(width: 3.0, height: 3.0))



// =================== Methods ====================

// Extensions can add new instance methods and type methods to existing types.
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}

// Instance methods added with an extension can also modify (or mutate) the instance itself. Structure and enumeration methods that modify self or its properties must mark the instance method as mutating, just like mutating methods from an original implementation.
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()


class SomeClass {
    var someProperty = "a"
    
}


// =================== Subscripts ====================

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
        
    }
}

374827[0]
39830[2]

// ======================== Nested Types =====================

extension Int {
    
    // nested type
    enum Kind {
        case negative, zero, positive
    }
    
    // computed property
    var kind: Kind {
        
        switch self {
            
        case 0:
            return .zero
            
        case let x where x > 0:
            return .positive
            
        default:
            return .positive
        }
    }
    
}

func printIntegerKinds(_ numbers: [Int]) {
    
    for number in numbers {
        
        switch number.kind {
            
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    
    
    
    print("")
}

printIntegerKinds([3, 29, -23, 0, -8, 0, 7])

