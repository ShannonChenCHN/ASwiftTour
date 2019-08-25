//
//  CheckingForProtocolConformance.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

func runExample13() {
    let objects: [AnyObject] = [
        Circle.init(radius: 2.0),
        Country.init(area: 243_610),
        Animal.init(legs: 4)
    ]


    for object in objects {
        
        if object is HasArea {
            print("Area conforms to protocol HasArea")
        }
        
        if let objectWithArea = object as? HasArea {
            print("Area is \(objectWithArea.area)")
        } else {
            print("Something that doesn't have an area")
        }
    }

}
