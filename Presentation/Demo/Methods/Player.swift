//
//  Player.swift
//  Methods
//
//  Created by ShannonChen on 2019/7/10.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


/*
 The `LevelTracker` structure uses type properties and methods
 to keep track of which levels of the game have been unlocked.
 It also tracks the current level for an individual player.
 */
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        // Update highest unlocked level
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    
    let playerName: String
    
    init(name: String) {
        playerName = name
    }
    
    // called whenever a player completes a particular level
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
}

/*
 The example below defines a structure called LevelTracker, which
 tracks a player’s progress through the different levels or stages
 of a game.
 
 It is a single-player game, but can store information for multiple
 players on a single device.
 
 All of the game’s levels (apart from level one) are locked when
 the game is first played. Every time a player finishes a level,
 that level is unlocked for all players on the device.
 
 */
func createAPlayer() {
    var player = Player.init(name: "Argyrios")
    player.complete(level: 1)
    print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
    
    player = Player.init(name: "Beto")
    if player.tracker.advance(to: 6) {
        print("player is now on level 6")
    } else {
        print("level 6 has not yet been unlocked")
    }
    
    player = Player.init(name: "Tim")
    if player.tracker.advance(to: 2) {
        print("player is now on level 2")
    } else {
        print("level 2 has not yet been unlocked")
    }
}
