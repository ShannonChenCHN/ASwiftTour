//
//  ReadOnlyComputedProperties.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/9.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    
    var volume: Double {
        return width * height * depth
    }
    /*
     A computed property with a getter but no setter is known as a read-only computed property.
     */
    
}

func createACuoid() {
    let fourByFiveByTwo = Cuboid.init(width: 4.0, height: 5.0, depth: 2.0)
    print("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
    
}


