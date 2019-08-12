//
//  InstanceMethodsOfStructures.swift
//  Methods
//
//  Created by ShannonChen on 2019/7/10.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation



struct Point {
    var x = 0.0, y = 0.0
    func isTotheRightof(x: Double) -> Bool {
        
        return self.x > x
        /*
          when a parameter name for an instance method has the same name as a property of that instance. In this situation, the parameter name takes precedence, and it becomes necessary to refer to the property in a more qualified way. You use the `self` property to distinguish between the parameter name and the property name.
         */
        
    }

    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        
        x += deltaX
        y += deltaY
    }
    /*
     Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.
     if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to `mutating` behavior for that method.
     
     why?
     1. "mutating methods signal to the compiler that calling a method on a value type instance will change it. The mutating keyword implicitly makes the instance itself—self—an inout parameter, and passes it as the first argument into the method’s parameter list." (see  https://www.bignerdranch.com/blog/protocol-oriented-problems-and-the-immutable-self-error/)
     2. What is “self” used for in Swift? https://stackoverflow.com/a/26835100
     Every instance of a type has an implicit property called self, which is exactly equivalent to the instance itself. You use the `self` property to refer to the current instance within its own instance methods.
     */
    
    // Assigning to self Within a Mutating Method
    mutating func moveByAgain(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

func createSomePoints() {
    let somePoint = Point(x: 4.0, y: 5.0)
    if somePoint.isTotheRightof(x: 1.0) {
        print("This point is to the right of the line where x = 1.0")
    }
    
    //let anotherPoint = Point(x: 4.0, y: 5.0)
    //anotherPoint.moveBy(x: 2.0, y: 3.0)
    // this will report an error
    
    var anotherPoint = Point(x: 4.0, y: 5.0)
    anotherPoint.moveBy(x: 2.0, y: 3.0)
    print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")
    
    anotherPoint.moveByAgain(x: 2.0, y: 3.0)
    print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")

}
