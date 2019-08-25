//
//  MethodRequirements.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

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


func runExample02() {
    let generator = LinearCongruentialGenerator()
    print("Here's a random number: \(generator.random())")

    print("And another one: \(generator.random())")

}
