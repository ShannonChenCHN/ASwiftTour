//
//  TypeMethods.swift
//  Methods
//
//  Created by ShannonChen on 2019/7/10.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


// You indicate type methods by writing the `static` keyword before the method’s func keyword. Classes may also use the `class` keyword to allow subclasses to override the superclass’s implementation of that method.
class SomeClass {
    static func someTypeMethod() {
        print("someTypeMethod got called.\n")
    }
    
    class func overrideableTypeMethod() {
        print("overrideableTypeMethod got called.\n")
    }
    
}


class Subclass: SomeClass {
    override class func overrideableTypeMethod() {
        print("overrideableTypeMethod got called in subclass.\n")
    }
}

func callTypeMethods() {
    SomeClass.someTypeMethod()
    SomeClass.overrideableTypeMethod()
    Subclass.overrideableTypeMethod()
}

