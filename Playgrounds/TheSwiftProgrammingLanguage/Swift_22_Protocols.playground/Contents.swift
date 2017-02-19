//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Protocols //////////////////////////////

// ========================= Protocol Syntax =========================

protocol FirstProtocol {
    // protocol definition goes here
}

protocol AnotherProtocol {
    // protocol definition goes here
}

struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}

class SomeSuperClass {
    // class definition goes here
}

class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}

// ======================== Property Requirements =====================

protocol SomeProtocol {
    
    // gettable and settable property
    var mustBeSettable: Int {
        get set
    }
    
    // gettable property
    var doesNotNeedToBeSettable: Int {
        get
    }
    
    // type property
    static var someTypeProperty: Int {
        get set
    }
    
    // method
    func someMethod()
    
    // type method
    static func someTypeMethod()
    
    // initializer
    init(someParameter: Int)
}


protocol FullyNamed {
    var fullName: String {
        get
    }
}

struct Person: FullyNamed {
    var fullName: String
    
}

let john = Person.init(fullName: "John Appleseed")


class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship.init(name: "Enterprise", prefix: "USS")


// ======================== Method Requirements =====================

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a) + c).truncatingRemainder(dividingBy: m)
        
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")

print("And another one: \(generator.random())")


// =================== Mutating Method Requirements ====================


// =================== Initializer Requirements ====================


// ======================== Protocols as Types =====================

// ======================== Delegation =====================


// ============== Adding Protocol Conformance with an Extension =============


// ===================== Collections of Protocol Types ========================


// ===================== Protocol Inheritance ========================


// ===================== Class-Only Protocol ========================

// ===================== Protocol Composition ========================


// ===================== Checking for Protocol Conformance ========================


// ===================== Optional Protocol Requirements ========================



// ===================== Protocol Extensions ========================
