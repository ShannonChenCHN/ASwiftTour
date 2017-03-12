//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Access Control //////////////////////////////

// ========================= Modules and Source Files ==========================


// ======================== Access Levels =====================

/**
 “All entities in your code (with a few specific exceptions, as described later in this chapter) have a default access level of 'internal' if you do not specify an explicit access level yourself.”
 
 摘录来自: Apple Inc. “The Swift Programming Language (Swift 3.1)”。 iBooks.
*/

// ======================== Access Control Syntax =====================

/*
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}
 
*/



// ========================== Custom Types ============================

/**
 “The access control level of a type also affects the default access level of that type’s members (its properties, methods, initializers, and subscripts)”
 
 */

public class SomePublicClass { // explicitly public
    /**
     “A public type defaults to having internal members, not public members. If you want a type member to be public, you must explicitly mark it as such. ”
 */
    public var somePublicProperty = 0 // explictly public class member
    var someInternalProperty = 0   // implictly internal class member
    fileprivate func someFilePrivateMethod() {}  // explictly private class member
    private func somePrivateMethod() {}  // explicitly private class member
}

class SomeInternalClass { // implicitly internal class member
    var someInternalProperty = 0 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explictly private class member
    private func somePrivateMethod() {}  // explicitly private class member
}

fileprivate class SomeFilePrivateClass {  // explicitly fileprivate class
    func someFilePrivateMethod() {} // implicitly fileprivate class member
    private func somePrivateMethod() {}  // explicitly private class member
}

private class SomePrivateClass {  // explicitly private class
    func somePrivateMethod() {} // implicitly private class member
    
}

/**
 “ You might expect this function to have the default access level of “internal”, but this is not the case. In fact, someFunction() will not compile”
 
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    
}
 */
 

private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    return (SomeInternalClass(), SomePrivateClass())
}

/**
 “The individual cases of an enumeration automatically receive the same access level as the enumeration they belong to. You cannot specify a different access level for individual enumeration cases.”
 */
public enum CompassPoint { // explicitly public enumeration
    case north  // implicitly public enmueration case
    case south
    case east
    case west
}

// ========================== Subclassing ==============================

public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    /**
     “An override can make an inherited class member more accessible than its superclass version.”
     
     It is even valid for a subclass member to call a superclass member that has lower access permissions than the subclass member.
 */
    override internal func someMethod() {
        super.someMethod()
    }
}

// ============ Constants, Variables, Properties, and Subscripts =====================

/**
 If a constant, variable, property, or subscript makes use of a private type, the constant, variable, property, or subscript must also be marked as private:
 */
private var privateInstance = SomePrivateClass()


public struct TrackedString {
    public private(set) var numberOfEdits = 0   // “the access level for the numberOfEdits property is marked with a private(set) modifier to indicate that the property’s getter still has the default access level of internal, but the property is settable only from within code that’s part of the TrackedString structure. ”
    
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    
    public init() {}
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += "This edit will increment numberOfEdits."
stringToEdit.value += "So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")


// ========================== Initializers ==============================


// ========================== Protocols ==============================



// ========================== Extensions ==============================


// ========================== Generics ==============================


// ========================== Type Aliases ==============================
