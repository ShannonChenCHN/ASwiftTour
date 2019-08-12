//
//  TheBasics.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/8.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


/*
 
 a stored property is a constant or variable that is stored as part of an instance of a particular `class` or `structure`(not enumeration).
 
 Stored properties can be either variable stored properties (introduced by the `var` keyword) or constant stored properties (introduced by the `let` keyword).
 
 You can provide a default value for a stored property as part of its definition.
 
 You can also set and modify the initial value for a stored property during initialization. This is true even for constant stored properties.
 
 */


struct FixedLengthRange {
    var firstValue: Int = 4// variable property
    let length: Int   // constant property
}

enum Sex {
    case male
    case female
}


class Person {
    var age: Int
    let sex: Sex

    init(age: Int, sex: Sex) {
        self.age = age
        self.sex = sex
    }
    
}


func createASturcture() {
    var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
    rangeOfThreeItems.firstValue = 6
    
//    rangeOfThreeItems.length = 4  // this will report an error
    
    
    // Stored properties of constant structure instances
    let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4) // this range represents integer values 0, 1, 2, and 3
//    rangeOfFourItems.firstValue = 6  // this will report an error
    
    /*
     If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties.
     This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties
     */

}
