//: Playground - noun: a place where people can play

import UIKit

///////////////////////////////////// Strings and Characters ////////////////////////////////////

// ======================= String Literals ==========================

let someString = "Some String literal value"

// ======================= Initializing an Empty String ==========================

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here.")
}

// ======================= String mutability ==========================

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander" // This reports a compile-time error

// ======================= Strings Are Value Types ==========================

/*
    Swift’s String type is a value type. If you create a new String value, that String value is copied when it is passed to a function or method, or when it is assigned to a constant or variable.
 */

// ======================= Working with Characters ==========================

// You can access the individual Character values for a String by iterating over its characters property with a for-in loop.
for character in "Dog!🐶".characters {
    print(character)
}

//  you can create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation.
let exclamationMark: Character = "!"

//  String values can be constructed by passing an array of Character values as an argument to its initializer.
let catCharacters: [Character] = ["C", "a", "t", "!", "🐈"]
let catString = String(catCharacters)
print(catString)

// ================ Concatenating Strings and Characters =========================

//  String values can be added together (or concatenated) with the addition operator (+) to create a new String value.
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

//  You can also append a String value to an existing String variable with the addition assignment operator (+=).
var instruction = "look over"
instruction += string2

// Method: append()
welcome.append(exclamationMark)

// ======================= String Interpolation ==========================

let multiplier = 3
let message = "\(multiplier) timer 2.5 is \(Double(multiplier) * 2.5)"

// ======================= Unicode ==========================

// Special characters in string literals
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarsign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

// Extended grapheme clusters
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

// ======================= Counting Characters ==========================
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🕊, Dromedary 🐫"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")


// ======================= Accessing and Modifying a String ==========================
let greeting = "Guten Tag!"
//greeting[0] // This will cause complie-error - "cannot subscript String with an Int"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.characters.indices {
    print("\(greeting[index])", terminator: "")
}

// Insert
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))

// Remove
welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

// ======================= Comparing Strings ==========================

// String and character equality
let quotation = "We're a lot alike, you and I"
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

//_______________ Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent.

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

// LATIN SMALL LETTER E WITH ACUTE (U+00E9) is canonically equivalent to LATIN SMALL LETTER E (U+0065) followed by COMBINING ACUTE ACCENT (U+0301). Both of these extended grapheme clusters are valid ways to represent the character é, and so they are considered to be canonically equivalent.
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}


// Conversely, LATIN CAPITAL LETTER A (U+0041, or "A"), as used in English, is not equivalent to CYRILLIC CAPITAL LETTER A (U+0410, or "А"), as used in Russian. The characters are visually similar, but do not have the same linguistic meaning
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}

// Prefix and suffix equality

// Method: asPrefix(_:)
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")


// Method: hasSuffix(_:)
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

// ======================= Unicode Representations of Strings ==========================

let dogString = "Dog‼🐶"

// UTF-8 representation
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("\n")

// UTF-16 representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("\n")

// Unicode scalar representation

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
