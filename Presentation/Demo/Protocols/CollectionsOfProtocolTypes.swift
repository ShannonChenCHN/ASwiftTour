//
//  CollectionsOfProtocolTypes.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


func runExample09() {
    let game = SnakesAndLadders()
    let d12 = Dice.init(sides: 12, generator: LinearCongruentialGenerator())
    let simonTheHamster = Hamster.init(name: "Simon")
    
    let things: [TextRepresentable] = [game, d12, simonTheHamster]

    // Note that the `thing` constant is of type `TextRepresentable`.
    for thing in things {
        print(thing.textualDescription)
    }
}
