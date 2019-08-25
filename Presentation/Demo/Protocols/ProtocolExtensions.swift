//
//  ProtocolExtensions.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}


func runExample16() {
    let generator = LinearCongruentialGenerator()
    print("Here's a random number: \(generator.random())")
    print("And here's a random Boolean: \(generator.randomBool())")
}

//------------------- Providing default implementations -------------------

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
    
}

//------------ Adding constraints to protocol extensions -----------------
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}


func runExample17() {
    let equalNumbers = [100, 100, 100, 100, 100]
    let differentNumbers = [100, 100, 200, 100, 200]
    let generators = [LinearCongruentialGenerator(), LinearCongruentialGenerator()]
    
    print(equalNumbers.allEqual())
    print(differentNumbers.allEqual())
//    print(generators.allEqual())
}
