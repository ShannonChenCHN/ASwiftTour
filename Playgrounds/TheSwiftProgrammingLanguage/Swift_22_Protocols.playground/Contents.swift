//: Playground - noun: a place where people can play

import UIKit

/* 
 作用:定义方法、属性和其他的 requirement
 适用对象：class，structure，enumeration
 
 
 
 
 */

//////////////////////////////  Protocols //////////////////////////////

// ========================= Protocol Syntax =========================

protocol FirstProtocol {
    // protocol definition goes here
}

protocol AnotherProtocol {
    // protocol definition goes here
}

struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}

class SomeSuperClass {
    // class definition goes here
    
    init() {
        
    }
}

protocol SomeProtocol {
    
    // gettable and settable property
    var mustBeSettable: Int {
        get set
    }
    
    // gettable property
    var doesNotNeedToBeSettable: Int {
        get
    }
    
    // type property
    static var someTypeProperty: Int {
        get set
    }
    
    // method
    func someMethod()
    
    // type method
    static func someTypeMethod()
    
    // initializer
    init(someParameter: Int)
    init()
}



// ======================== Property Requirements =====================
protocol FullyNamed {
    var fullName: String {
        get
    }
}

struct Person: FullyNamed {
    var fullName: String
    
}

let john = Person.init(fullName: "John Appleseed")


class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship.init(name: "Enterprise", prefix: "USS")


// ======================== Method Requirements =====================

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a) + c).truncatingRemainder(dividingBy: m)
        
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")

print("And another one: \(generator.random())")


// =================== Mutating Method Requirements ====================

protocol Togglable {
    
    // The mutating keyword is only used by structures and enumerations.
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()


// =================== Initializer Requirements ====================

class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol, SomeProtocol {
    var mustBeSettable: Int = 1
    var doesNotNeedToBeSettable: Int = 1
    static var someTypeProperty: Int = 1
    
    func someMethod() {
        
    }
    static func someTypeMethod() {
        
    }
    
    // You can implement a protocol initializer requirement on a conforming class as either a designated initializer or a convenience initializer. In both cases, you must mark the initializer implementation with the required modifier
    required init(someParameter: Int) {
        
        
    }
    
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    override required init() {
        
    }
}

// ======================== Protocols as Types =====================

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice.init(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

// ======================== Delegation =====================

protocol DiceGame {
    var dice: Dice {
        get
    }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice.init(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array.init(repeating: 0, count: finalSquare + 1)
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
    }
    
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
            
        }
        delegate?.gameDidEnd(self)
    }
    
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    
    func gameDidStart(_ game: DiceGame) {
        // Resets numberOfTurns to zero when the game starts
        numberOfTurns = 0
        
        
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        // Increments numberOfTurns each time a new turn begins
        numberOfTurns += 1
        
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
    
}


let tracker = DiceGameTracker()
let game = SnakesAndLadders()

game.delegate = tracker
//game.play()

// ============== Adding Protocol Conformance with an Extension =============
protocol TextRepresentable {
    var textualDescription: String { get }
}

// The `Dice` class from earlier can be extended to adopt and conform to `TextRepresentable`
extension Dice: TextRepresentable {
    
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
    
}

let d12 = Dice.init(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
    
}

print(game.textualDescription)


// “Declaring Protocol Adoption with an Extension”
struct Hamster {
    var name: String
    
    var  textualDescription: String {
        return "A hamster named \(name)"
    }
    
}

extension Hamster: TextRepresentable {}

// Instance of `Hamster` can now be used wherever `TextRepresentable` is the require type.
let simonTheHamster = Hamster.init(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)



// ===================== Collections of Protocol Types ========================

let things: [TextRepresentable] = [game, d12, simonTheHamster]

// Note that the `thing` constant is of type `TextRepresentable`.
for thing in things {
    print(thing.textualDescription)
}


// ===================== Protocol Inheritance ========================

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

print(game.prettyTextualDescription)


// ===================== Class-Only Protocol ========================
// `someClassOnlyProtocol` can only be adopted by class types
protocol SomeClassOnlyProtocol: class, SomeProtocol {
    
}


// ===================== Protocol Composition ========================

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct PersonInfo: Named, Aged {
    var name: String
    var age: Int
}

// The type of `celebrator` parameter is `Named & Aged`, which means "any type that conforms to both the `Named` and `Aged` protocols.
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = PersonInfo.init(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

// ===================== Checking for Protocol Conformance ========================
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [
    Circle.init(radius: 2.0),
    Country.init(area: 243_610),
    Animal.init(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
       print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

// ===================== Optional Protocol Requirements ========================

/**
  You can define optional requirements for protocols, These requirements do not have to be implemented by types that conform to the protocol. 
 
  Optional requirements are prefixed by the optional modifier as part of the protocol’s definition. Optional requirements are available so that you can write code that interoperates with Objective-C. Both the protocol and the optional requirement must be marked with the @objc attribute. Note that @objc protocols can be adopted only by classes that inherit from Objective-C classes or other @objc classes. They can’t be adopted by structures or enumerations.
 
 */
@objc protocol CounterDataSource {
    
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int {
        get
    }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
    
}


class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

// Why do we use `@objc` here?
@objc class TowardsZeroSource: NSObject, CounterDataSource {
    
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}


// ===================== Protocol Extensions ========================

/**
  Protocols can be extended to provide method and property implementations to conforming types. This allows you to define behavior on protocols themselves, rather than in each type’s individual conformance or in a global function.
 */
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let newGenerator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")

// By creating an extension on the protocol, all conforming types automatically gain this method implementation without any additional modification.
print("And here's a random Boolean: \(generator.randomBool())")

/* Providing default implementations */
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
    
}

/* Adding constraints to protocol extensions */
/**
 When you define a protocol extension, you can specify constraints that conforming types must satisfy before the methods and properties of the extension are available. You write these constraints after the name of the protocol you’re extending using a generic where clause, as described in Generic Where Clauses.
 */
extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map {
            $0.textualDescription
        }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}


let murrayTheHamster = Hamster.init(name: "Murray")
let morganTheHamster = Hamster.init(name: "Morgan")
let mauriceTheHamster = Hamster.init(name: "Maurice")

let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]

// Because Array conforms to Collection and the array’s elements conform to the TextRepresentable protocol, the array can use the textualDescription property to get a textual representation of its contents
print(hamsters.textualDescription)

