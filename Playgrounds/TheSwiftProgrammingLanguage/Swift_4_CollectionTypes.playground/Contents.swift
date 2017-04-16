//: Playground - noun: a place where people can play

import UIKit

///////////////////////////////////// Collection Types ////////////////////////////////////

// ======================= Mutability of Collections ==========================

let immutableArray = ["a", "b"]
var mutableArray = ["c", "d"]
//immutableArray.append("f")
mutableArray.append("e")

// ======================= Arrays ==========================

// Creating an empty array
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count)")

someInts.append(3)
someInts = []

// Creating an array with a default value
var threeDoubles = Array.init(repeating: 0.0, count: 3)

// Creating an array by adding two arrays together
var anotherThreeDoubles = Array.init(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// Creating an array with an array literal
//var shoppingList: [String] = ["Egg", "Milk"]
var shoppingList = ["Egg", "Milk"]


// Assigning and modifying an array

// Property: count
print("The shopping list contains \(shoppingList.count) items")

// Property: isEmpty
if shoppingList.isEmpty {
    print("The shooping list is empty")
} else {
    print("The shopping list is not empty")
}

// Method: append(_:)
shoppingList.append("Flour")

// append an array of one or more compatible items with the addition assignment operator (+=).
shoppingList += ["Baking Powder"]

//  subscript syntax
var firstItem = shoppingList[0]
shoppingList[0] = "six eggs"

// You can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing.
shoppingList[0...2] = ["Bananas", "Apples", "Oranges"]
print(shoppingList)


// Insert
shoppingList.insert("Maple Syrup", at: 0)

// Remove
shoppingList.remove(at: 0)
shoppingList.removeFirst()
shoppingList.removeLast()


// Iterating over an array
for item in shoppingList {
    print(item)
}

for(indx, value) in shoppingList.enumerated() {
    print("Item (\(index) + 1): \(value)")
}

// ======================= Sets ==========================

// Hash values for set types
// A type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself.

// Creating and initializing an empty set 
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = [] // letters is now an empty set, but is still of type Set<Character>

// Creating a set with array literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// or
//var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]


// Accessing and modifying a set
// Property :count
print("I have \(favoriteGenres.count) favorite music genres.")

// Property: isEmpty
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
}

// Method: insert
favoriteGenres.insert("Jazz")

// Method: contains
if favoriteGenres.contains("Jazz") {
    print(" favoriteGenres contains Jazz")
}

// Remove
if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre)? I'm over it.")
}

// Iterating over a set

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// ======================= Performing Set Operations ==========================

// Fundamental set operations

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(singleDigitPrimeNumbers).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers)

// Set membership and equality
let houseAnimals: Set = ["🐶", "🐈"]
let farmAnimals: Set = ["🐂", "🐔", "🐑", "🐶", "🐈"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

// ======================= Dictionaries ==========================

// Creating an empty dictionary

var namesOfIntegers = [Int: String]()

// If the context already provides type information, you can create an empty dictionary with an empty dictionary literal, which is written as [:].
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

// Creating a dictionary with a dictionary literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// or
// var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// Accessing and modifying a dictionary

// Property: count
print("The airports dictionary contains \(airports.count) itms.")

// Property: isEmpty
if airports.isEmpty {
    print("The airports dictionary is empty.")
}

// You can add a new item to a dictionary with subscript syntax.
airports["LHR"] = "London"

// You can also use subscript syntax to change the value associated with a particular key.
airports["LHR"] = "London Heathrow"


// Method: updateValue(_:forKey:)
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

// You can also use subscript syntax to retrieve a value from the dictionary for a particular key.

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
}

// You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key.
airports["APL"] = "Apple International"
airports["APL"] = nil

// Method: removeValue(forKey:)
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
}



// Iterating over a dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its keys and values properties.
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property.
let airport = [String](airports.keys)
let airportNames = [String](airports.values)


