//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Initialization //////////////////////////////

// ========= Setting Initial Values for Stored Properties =================

struct Fahrenheit {
    var temperature: Double
    var isUsedInChina = false  // default property values
    
    init() {
        temperature = 32.0
    }
    
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")




// ======================== Customizing Initialization =====================

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    // Initializer parameters without argument labels
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius.init(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius.init(fromKelvin: 273.15)
let bodyTemperature = Celsius(37.0)

// Parameter Names and Argument Labels
struct Color {
    let red, green, blue: Double
    
    // By default, parameters use their parameter names as their argument label
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    
}

let magenta = Color.init(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color.init(white: 0.5)

//let veryGreen = Color(0.0, 1.0, 0.0) // this report a compile-time error - argument labels are required



// Optional Property types

class SurveyQuestion {
//    var text: String
    let text: String  // You can assign a value to a constant property at any point during initialization
    
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion.init(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese"


class ShortSurveyQuestion: SurveyQuestion {
    
    // this report a compile-error ---- because a constant property cannot be modified by a subclass, even if in initialzers
//    override init(text: String) {
//        self.text = text.substring(to: 15)
//    }
}


// ======================== Default Initializers =====================

class ShoppingItem {
    var name: String?
    var quantity = 1
    var purchased = false
    
}

var item = ShoppingItem()


// Structure types automatically receive a memberwise initializer if they do not define any of their own custom initializers.
struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size.init(width: 2.0, height: 2.0)



// =================== Initializer Delegation for Value Types ====================
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {
        
    }
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
        
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
    
    init(rect: Rect) {
        self.init(origin: rect.origin, size: rect.size)
    }
    
}

let basicRect = Rect.init()
let originRect = Rect.init(origin: Point.init(x: 2.0, y: 2.0),
                           size: Size.init(width: 5.0, height: 5.0))
let centerRect = Rect.init(center: Point.init(x: 4.0, y: 4.0),
                           size: Size.init(width: 3.0, height: 3.0))



// =================== Class Inheritance and Initialization ====================
// Initializer Inheritance and Overriding
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicyle: Vehicle {
    
    /*
     This designated initializer matches a designated initializer from the superclass of Bicycle, and so the Bicycle version of this initializer is marked with the override modifier.
 */
    override init() {
        super.init()  // This ensures that the numberOfWheels inherited property is initialized by Vehicle before Bicycle has the opportunity to modify the property.
        
        numberOfWheels = 2
    }
}

let aBicycle = Bicyle()
print("Bicycle: \(aBicycle.description)")


// Designated and Convenience Initializers in Action

class Food {
    var name: String
    
    /*
     Designated initializer, because it ensures that all stored properties of a new Food instance are fully initialized.
     */
    init(name: String) {
        self.name = name
        
        /*
         The Food class does not have a superclass, and so the init(name: String) initializer does not need to call super.init() to complete its initialization.
         */
 
    }
    /*
      A subclass can implement a superclass designated initializer as a subclass convenience initializer as part of satisfying rule 2 in "Automatic Initializer Inheritance".
     */
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food.init(name: "Bacon")

let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        // Firstly, assigning the passed `quantity` argument to the `quantity` property, which is the only new property introduced by RecipeIngredient
        self.quantity = quantity
        
        // Then, delegates up to the init(name: String) initializer of the Food class
        super.init(name: name)
        
        /* This process satisfies safety check 1 from Two-Phase Initialzation */
        
    }
    
    
    /*
       This convenience initializer assumes a quantity of 1 for any RecipeIngredient instance that is created without an explicit quantity. The definition of this convenience initializer makes RecipeIngredient instances quicker and more convenient to create, and avoids code duplication when creating several single-quantity RecipeIngredient instances. This convenience initializer simply delegates across to the class’s designated initializer, passing in a quantity value of 1.
     */
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}


// `RecipeIngredient` inherits Food's single convenience initializer `init()`
let oneMysteryItem = RecipeIngredient()

let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)



/*
  Because it provides a default value for all of the properties it introduces and does not define any initializers itself, ShoppingListItem automatically inherits all of the designated and convenience initializers from its superclass.
 */
class ShoppingListItem: RecipeIngredient {
    var purchase = false
    
    var description: String {
        var output = "\(quantity) x \(name) "
        output += purchase ? "✔️" : "❌"
        return output
    }
    
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchase = true
for item in breakfastList {
    print(item.description)
}


// ======================== Failable Initializers =====================

struct Animal {
    let species: String
    
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anoymousCreature = Animal(species: "")

if anoymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

// Failable Initializers for Enumerations

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

// Failable Initializers for Enumerations with Raw Values
enum TemperatureUnitRaw: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

// Note: Because this enumeration is a raw-value type, it automatically receives an initializaer that take a value of the raw value's type and returns either an enumeration case or nil.
let fahrenheitUnitRaw = TemperatureUnitRaw(rawValue: "F")
if fahrenheitUnitRaw != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnitRaw = TemperatureUnitRaw(rawValue: "X")
if unknownUnitRaw == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}


// Propagation of Initialization Failure
class Product {
    let name: String
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}


class CartItem: Product {
    let quantity: Int
    
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        
        
        self.quantity = quantity
        
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

// Overriding a Failable Initializer

class Document {
    var name: String?
    
    init() {
    
    }
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    
    override init() {
        super.init()
        
        self.name = "[Untitled]"
    }
    
    override init?(name: String) {
        super.init()
        
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
//        super.init(name: "[Untitled]")
        super.init(name: "[Untitled]")!
    }
}

// ========================= Required Initializers ===========================
class SomeClass {
    required init() {
        
    }
}

class SomeSubclass: SomeClass {
    // `required` modifier must be present on all overrides of a required initializer
//    required init() {
//        
//    }
}

// ===== Setting a Default Property Value with a Closure or Function =============
struct Chessboard {
    
    // Whenever a new Chessboard instance is created, the closure is executed, and the default value of boardColors is calculated and returned.
    let boardColors: [Bool] = {
        
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }() // the closure’s end curly brace is followed by an empty pair of parentheses. This tells Swift to execute the closure immediately.
    
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()

print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))





