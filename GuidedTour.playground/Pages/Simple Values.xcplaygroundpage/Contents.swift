//: # A Swift Tour
//:
//: Tradition suggests that the first program in a new language should print the words “Hello, world!” on the screen. In Swift, this can be done in a single line:
//:
print("Hello, world!")

//: If you have written code in C or Objective-C, this syntax looks familiar to you—in Swift, this line of code is a complete program. You don’t need to import a separate library for functionality like input/output or string handling. Code written at global scope is used as the entry point for the program, so you don’t need a `main()` function. You also don’t need to write semicolons at the end of every statement.
//:
//: This tour gives you enough information to start writing code in Swift by showing you how to accomplish a variety of programming tasks. Don’t worry if you don’t understand something—everything introduced in this tour is explained in detail in the rest of this book.
//:
//: ## Simple Values
//:
//: Use `let` to make a constant and `var` to make a variable. The value of a constant doesn’t need to be known at compile time, but you must assign it a value exactly once. This means you can use constants to name a value that you determine once but use in many places.
//:
var myVariable = 42
myVariable = 50
let myConstant = 42
let  myDictionary: Dictionary = ["d" : "f"]
print(myDictionary)



//: A constant or variable must have the same type as the value you want to assign to it. However, you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type. In the example above, the compiler infers that `myVariable` is an integer because its initial value is an integer.
//:
//: If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon.
//:
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70


let label = "The Width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

//: - Experiment:
//: Try removing the conversion to `String` from the last line. What error do you get?
//:
//: There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (`\`) before the parentheses. For example:
//:
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let kids = 5
let sayHello = "Hello, Mrs.Brown! You have \(kids) kids, right?"
print(sayHello)

//: - Experiment:
//: Use `\()` to include a floating-point calculation in a string and to include someone’s name in a greeting.
//:
//: Create arrays and dictionaries using brackets (`[]`), and access their elements by writing the index or key in brackets. A comma is allowed after the last element.
//:
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
//shoppingList[2] = ["4"]
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]
occupations["Jayne"] = "Public Relations"
//occupations["haha"] = ["haha"]
print(shoppingList, "\n", occupations)
//: To create an empty array or dictionary, use the initializer syntax.
//:
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
//emptyArray[0] = "ok"

var numArray = [5]
//var numArray = [5, "e"]
print(numArray)
//: If type information can be inferred, you can write an empty array as `[]` and an empty dictionary as `[:]`—for example, when you set a new value for a variable or pass an argument to a function.
//:
shoppingList = []
occupations = [:]



//: See [License](License) for this sample's licensing information.
//: 
//: [Next](@next)
