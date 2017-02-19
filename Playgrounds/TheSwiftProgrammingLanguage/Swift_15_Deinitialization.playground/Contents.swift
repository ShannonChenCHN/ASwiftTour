//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Deinitialization //////////////////////////////

// ========= How Deinitialization Works =================



// ======================== Deinitializers in Action =====================

class Bank {
    static var coinsInBank = 10_000 // Type property
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}


class Player {
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

// An optional variable is used here, because players can leave the game at any point. The optional lets you track whether there is currently a player in the game.
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse)")

print("There are now \(Bank.coinsInBank) coins left in the bank")


playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse)")

print("The bank now only has \(Bank.coinsInBank) coins left")


playerOne = nil
print("PlayerOne has left the game")

print("The bank now has \(Bank.coinsInBank) coins")
