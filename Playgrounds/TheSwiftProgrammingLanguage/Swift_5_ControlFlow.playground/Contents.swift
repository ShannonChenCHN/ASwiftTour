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


//___________ Repeat-While
var needExit = false
repeat {
    for i in 1..<10 {
        if i == 8 {
            needExit = true
        }
    }
    
} while !needExit



// ======================= Conditional Statements ==========================

let temperatureInFahrenheit = 72

if temperatureInFahrenheit <= 32 {
    
    print("It's very cold.")
    
} else if temperatureInFahrenheit >= 86 {
    
    print("It's really warm.")
    
} else {
    
    print("It's not that cold.")
    
}


//-_____________________ Switch

let anotherCharacter: Character = "a"

// The body of each case must contain at least one executable statement.
//switch anotherCharacter {
//case "a":
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter a")
//}

switch anotherCharacter {
    case "a", "A":
        print("The letter A")
    default:
        print("Not the letter a")
}

// Interval matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
    
default:
    naturalCount = "many"
}



// Tuples
let somePoint = (1, 1)

switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}


// Value binding
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x vlaue of \(x)")
case (0, let y):
    print("on te y-axis with a y value of \(y)")
case let(x, y):
    print("comewhere else at (\(x), \(y))")
}


// Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let(x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// Compound cases
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}


// ======================= Control Transfer Statements ==========================

// Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}

print(description)


// Labeled Statements
var myVar = 4
myLoop: while myVar < 10 {
    
    myVar += 1
    
    switch myVar % 2 {
    case 0:
        print("\(myVar) is an even number.")
        break myLoop
    case 1:
        print("\(myVar) is an odd number.")
        continue myLoop
    default:
        break
    }
    
    
}

// ======================= Early Exit ==========================


func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location)")
    
}



// ======================= Checking API Availability ==========================


if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}


