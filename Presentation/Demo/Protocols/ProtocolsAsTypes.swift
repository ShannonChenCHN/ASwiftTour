//
//  ProtocolsAsTypes.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


class Dice {
    let sides: Int
    let generator: RandomNumberGenerator // generator's type is a Protocol
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

func runExample04() {
    let d6 = Dice.init(sides: 6, generator: LinearCongruentialGenerator())

    for _ in 1...5 {
        print("Random dice roll is \(d6.roll())")
    }
}
