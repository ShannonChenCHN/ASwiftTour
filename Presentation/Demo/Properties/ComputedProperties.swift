//
//  ComputedProperties.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/9.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

/*
 
 classes, structures, and enumerations can define computed properties, which do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.
 
 */


struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        /*
         note: You must declare computed properties—including read-only computed properties—as variable properties with the `var` keyword, because their value is not fixed.
         */
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)

        }
        
        // 可选
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

func createASquare() {
    var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
    let initialSquareCenter = square.center
    print("square.origin is now at (\(initialSquareCenter.x), \(initialSquareCenter.y))\n")

    square.center = Point.init(x: 15.0, y: 15.0)
    print("after update square's center")
    print("square.origin is now at (\(square.origin.x), \(square.origin.y))\n")

}
