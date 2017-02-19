//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Nested Types //////////////////////////////

// ========= Nested Types in Action =================


struct BlackjackCard {
    
    // nested Suit enumeration
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    // nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            
            switch self {
                
            case .ace:
                return Values.init(first: 1, second: 11)
                
            case .jack, .queen, .king:
                return Values.init(first: 10, second: nil)
                
            default:
                return Values.init(first: self.rawValue, second: nil)
            }
        }
    }
    
    
    // BlakjackCard properties and methods
    var rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        
        if let second = rank.values.second {
            output += " or \(second)"
        }
        
        return output
        
    }
    
}


let theAceOfSpades = BlackjackCard.init(rank: .ace, suit: .spades)

print("theAceOfSpades: \(theAceOfSpades.description)")

// ======================== Referring to Nested Types =====================


let heartSymbol = BlackjackCard.Suit.hearts.rawValue


