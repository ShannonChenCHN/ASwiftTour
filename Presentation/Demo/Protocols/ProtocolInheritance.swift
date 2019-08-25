//
//  ProtocolInheritance.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}


// “ Anything that adopts PrettyTextRepresentable must satisfy all of the requirements enforced by TextRepresentable, plus the additional requirements enforced by PrettyTextRepresentable”
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
    
}

// The SnakesAndLadders class can be extended to adopt and conform to PrettyTextRepresentable
extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        
        for index in 1...finalSquare {
            
            switch board[index] {
                
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        
        return output
    }
    
}


func runExample10() {
    let game = SnakesAndLadders()
    print(game.prettyTextualDescription)
}
