//: Playground - noun: a place where people can play

import UIKit

///////////////////////////////////// Control Flow ////////////////////////////////////

// ======================= For-In Loops ==========================

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

/**
  If you don’t need each value from a sequence, you can ignore the values by using an underscore in place of a variable name.
 */

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

print("\(base) to be the power of \(power) is \(answer)")


/**
  Use a for-in loop with an array to iterate over its items.
 */
let  names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, I am \(name)!")
}


/**
  Items in a Dictionary may not necessarily be iterated in the same order in which they were inserted.
 */
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


// ======================= While Loops ==========================

////////// while ///////////

/**
 This example plays a simple game of Snakes and Ladders (also known as Chutes and Ladders):
 */

// the game `board` is represented by an array of Int values. Its size is based on the constant `finalSquare`.
let finalSquare = 25
var board = [Int].init(repeating: 0, count: finalSquare + 1)


board[03] = +08; // squares with a ladder base have a positive number to move you up the board
board[06] = +11;
board[09] = +09;
board[10] = +02;
board[14] = -10; // squares with a snake head have a negative number to move you back down the board
board[19] = -11;
board[22] = -02;
board[24] = -08;

var square = 0
var diceRoll = 0


// The board has 25 squares, and the aim is to land on or beyond square 25.
// Each turn, you roll a six-sided dice and move by that number of squares, following the horizontal path indicated by the dotted arrow above.
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    
    if diceRoll == 7 {
        diceRoll = 1
    }
    
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
    
}

print("Game over!")


// ======================= Conditional Statements ==========================


// ======================= Control Transfer Statements ==========================

// ======================= Early Exit ==========================

// ======================= Checking API Availability ==========================