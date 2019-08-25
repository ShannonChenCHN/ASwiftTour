//
//  AddingProtocolConformanceWithAnExtension.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


protocol TextRepresentable {
    var textualDescription: String { get }
}

// The `Dice` class from earlier can be extended to adopt and conform to `TextRepresentable`
extension Dice: TextRepresentable {
    
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
    
}

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
    
}

func runExample06() {
    let d12 = Dice.init(sides: 12, generator: LinearCongruentialGenerator())
    print(d12.textualDescription)
    
    let game = SnakesAndLadders()
    print(game.textualDescription)
}


//---------- “Conditionally Conforming to a Protocol”----------

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}


func runExample07() {
    let d6 = Dice.init(sides: 6, generator: LinearCongruentialGenerator())
    let d12 = Dice.init(sides: 12, generator: LinearCongruentialGenerator())
    let myDice = [d6, d12]
    print(myDice.textualDescription)
}


//---------- “Declaring Protocol Adoption with an Extension” ------------
struct Hamster {
    var name: String
    
    var  textualDescription: String {
        return "A hamster named \(name)"
    }
    
}

extension Hamster: TextRepresentable {}


func runExample08() {
    // Instance of `Hamster` can now be used wherever `TextRepresentable` is the require type.
    let simonTheHamster = Hamster.init(name: "Simon")
    let somethingTextRepresentable: TextRepresentable = simonTheHamster
    print(somethingTextRepresentable.textualDescription)
}
