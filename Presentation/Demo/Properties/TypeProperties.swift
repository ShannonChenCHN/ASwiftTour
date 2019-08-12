//
//  TypeProperties.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/10.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


// structure
struct SomeStructure {
    static let contantProperty = "Hello" // like static constant in C
    static var storedTypeProperty = "Some value." // like static variable in C
    static var computedTypeProperty: Int {
        return 1
    }
}


// enumeration
enum someEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

// class
class SomeClass {
    static var storedTypeProperty = "Some value."
    /*
     Unlike stored instance properties, you must always give stored type properties a default value.
     This is because the type itself does not have an initializer that can assign a value to a stored type property at initialization time.
     */
    static var computedTypeProperty: Int {
        return 27
    }
    
    // For computed type properties for class types, you can use the `class` keyword instead to allow subclasses to override the superclass’s implementation.
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

class Subclass: SomeClass {
    override class var overrideableComputedTypeProperty: Int {
        return 108
    }
}


func printTypeProperties() {
    print(SomeStructure.contantProperty)
//    SomeStructure.contantProperty = "jjjj" // will report an error
    
    print(SomeStructure.storedTypeProperty)
    SomeStructure.storedTypeProperty = "Another value"
    print(SomeStructure.storedTypeProperty)
    
    print(someEnumeration.computedTypeProperty)
    
    print(SomeClass.computedTypeProperty)
    print(SomeClass.overrideableComputedTypeProperty)
    print(Subclass.computedTypeProperty)
    print(Subclass.overrideableComputedTypeProperty)
}

