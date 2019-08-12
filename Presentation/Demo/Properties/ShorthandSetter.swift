//
//  ShorthandSetter.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/9.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

// Shorthand setter declaration
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        /*
         get {
             Point(x: origin.x + (size.width / 2),
                   y: origin.y + (size.height / 2))
         
         }
         
         (Swift 5.1+)If the entire body of a getter is a single expression, the getter implicitly returns that expression.
         */
        
        set {
            // If a computed property’s setter does not define a name for the new value to be set, a default name of `newValue` is used.
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
    
}


