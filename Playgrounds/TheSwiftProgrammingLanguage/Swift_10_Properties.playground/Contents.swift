//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Properties //////////////////////////////

// ==================== Stored Properties ===========================

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
//rangeOfThreeItems.length = 4  // this will report an error

// Stored properties of constant structure instances
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6  // this will report an error



// Lazy stored properties
class DataImporter {
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a non-trivial amount of time to initialize.
 
 */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
    
}


class DataManager {
    lazy var imporer = DataImporter() // lazy cannot be used on a let
    
    var data = [String]()
    // the DataManager class would provide data management functionality here
    
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

print(manager.imporer.filename)

// ==================== Computed Properties ===========================
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point.init(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


// Shorthand setter declaration
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set {
            // If a computed property’s setter does not define a name for the new value to be set, a default name of newValue is used.
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
    
}


// Read-Only computed properties
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    
    var volume: Double {
        return width * height * depth
    }
    
}

let fourByFiveByTwo = Cuboid.init(width: 4.0, height: 5.0, depth: 2.0)

print("The volume of fourByFiveByTwo is \(fourByFiveByTwo)")

// ==================== Property Observers ===========================

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
//stepCounter.totalSteps = 200
//stepCounter.totalSteps = 360
//stepCounter.totalSteps = 896

class MyStepCounter: StepCounter {
    override var totalSteps: Int {
        willSet {
           print("About to set totalSteps to \(newValue)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let step = MyStepCounter()
step.totalSteps = 23
step.totalSteps = 56

// ==================== Global and Local Variables ===========================

// ==================== Type Properties ===========================
// Similar to static const and static variables in C/Objective-C
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}


enum someEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    
    // For computed type properties for class types, you can use the `class` keyword instead to allow subclasses to override the superclass’s implementation.
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)

SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)

print(someEnumeration.computedTypeProperty)

print(SomeClass.computedTypeProperty)




struct AudioChannel {
    static let thresholdLevel = 10 // Similar to `static Integer const thresholdLevel = 10`
    static var maxInputLevelForAllChannels = 0// Similar to `static Integer thresholdLevel = 0`

    
    var currentLevel: Int = 0 {
        
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}


var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)



