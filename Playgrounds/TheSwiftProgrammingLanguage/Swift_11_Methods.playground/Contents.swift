//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Methods //////////////////////////////

// ==================== Instance Methods ===========================


class Counter {
    var count = 0
    func incremnt() {
        count += 1
    }
    
    func incremnt(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.incremnt()
counter.incremnt(by: 5)
counter.reset()






struct Point {
    var x = 0.0, y = 0.0
    func isTotheRightof(x: Double) -> Bool {
        return self.x > x
        /* “when a parameter name for an instance method has the same name as a property of that instance. In this situation, the parameter name takes precedence, and it becomes necessary to refer to the property in a more qualified way. You use the `self` property to distinguish between the parameter name and the property name.”
         */

    }
    /*
     Structures and enumerations are value types. By default, the properties of a 【value type】 cannot be modified 【from within its instance methods】.
     if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to `mutating` behavior for that method.
     */
     mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
    // Assigning to self Within a Mutating Method
    mutating func moveByAgain(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isTotheRightof(x: 1.0) {
    print("This point is to the right of the line where x = 1.0")
}

//let anotherPoint = Point(x: 4.0, y: 5.0)
//anotherPoint.moveBy(x: 2.0, y: 3.0)  
// this will report an error

var anotherPoint = Point(x: 4.0, y: 5.0)
anotherPoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")

anotherPoint.moveByAgain(x: 2.0, y: 3.0)
print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")




// Mutating methods for enumerations can set the implicit self parameter to be a different case from the same enumeration

enum TriStateSwitch {
    case off, low, high
    
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
            
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

// ==================== Type Methods ===========================
// You indicate type methods by writing the `static` keyword before the method’s func keyword. Classes may also use the `class` keyword to allow subclasses to override the superclass’s implementation of that method.
class SomeClass {
    class func someTypeMethod() {
        
    }
    
}

SomeClass.someTypeMethod()


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
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}


var player = Player.init(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player.init(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}





