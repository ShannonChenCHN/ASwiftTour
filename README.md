<img src="https://swift.org/assets/images/swift.svg" alt="Swift logo" height="70" >

# The Swift Programming Language(3.1) 学习笔记

# About
A outline to sketch the content in *The Swift Programming Language(3.1)*.

This list is intended for consolidating the content of *The Swift Programming Language(3.1)* and forming a sturctured understanding of Swift. 

The Playgrounds related to the book is [here](https://github.com/ShannonChenCHN/ASwiftTour/tree/master/Playgrounds/TheSwiftProgrammingLanguage).

## Contents
- [The Basics](#the-basics)
- [Basic Operators](#basic-operators)
- [Strings and Characters](#strings-and-characters)
- [Collection Types](#collection-types)
- [Control Flow](#control-flow)
- [Functions](#functions)
- [Closures](#closures)
- [Enumerations](#enumerations)
- [Classes and Structures](#classes-and-structures)
- [Properties](#properties)
- [Methods](#methods)
- [Subscripts](#subscripts)
- [Inheritance](#inheritance)
- [Initialization](#initialization)
- [Deinitialization](#deinitialization)
- [Automatic Reference Counting](#automatic-reference-counting)
- [Optional Chaining](#optional-chaining)
- [Error Handling](#error-handling)
- [Type Casting](#type-casting)
- [Nested Types](#nested-types)
- [Extensions](#extensions)
- [Protocols](#protocols)
- [Generics](#generics)
- [Access Control](#access-control)
- [Advanced Operators](#advanced-operators)


## [The Basics](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309)
- Overview
    - Fundamental C and Objective-C Types(Int, Double, Float, Bool, String, Array, Set, Dictionary)
    - Variables and Constants
    - Advanced Types(like tuples)
    - Optional Types
    - Type Safety
- Constants and Variables
    - Declaring Constants and Variables
        - Constants
        - Variables
    - Type Annotations
        - What is Type Annotations
        - When to Use
    - Naming Constants and Variables
        - Can Contain
        - Cannot Contain
    - Printing Constants and Variables
        - Function for Print
        - String Interpolation

- Comments
    - Single-line comments
    - Multiline comments

- Semicolons
    - When to Use

- Integers
    - What is Integer
        - Definition
        - Signed and Unsigned 
        - Bit Forms(8, 16, 32, 64)
    - Integer Bounds
    - Int
        - Int Type is a Value Type(Structure)
        - Size
        - When to Use
    - UInt
        - Size
        - When to Use

- Floating-Point Numbers
    - Double
    - Float

- Type Safety and Type Inference
    - Type Safety
    - Type Inference

- Numeric Literals
    - Integer literals
        - decimal 
        - binary
        - octal
        - hexadecimal
    - Floating-point literals
        - decimal
        - hexadecimal
        - exponent

- Numeric Type Conversion
    - Integer Conversion
    - Integer and Floating-Point Conversion
    
- Type Aliases
    
- Booleans

- Tuples
    - What is Tuples
    - Creating a Tuple
    - Decompose

- Optionals
    - What is Optionals
    - How about Optionals in C or Objective-C
    - nil in Swift and Objective-C
    - If Statements and Forced Unwrapping
    - Optional Binding
    - Implicitly Unwrapped Optionals

- Error Handling
    - What is Error Handling
    - Do, Try, Catch and Throws 

- Assertions
    - What is Assertions
    - Debugging with Assertions
    - When to Use

## [Basic Operators](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/BasicOperators.html#//apple_ref/doc/uid/TP40014097-CH6-ID60)
- Overview
    - What is Operator
    - What Beyond C
        - Assignment Operator
        - Detecting and Disallowing Value Overflow
        - Range Operators
        - Advanced Operators

- Terminology
    - Unary
    - Binary
    - Ternary

- Assignment Operator(`=`)
    - The assignment operator in Swift does not itself return a value

- Arithmetic Operators
    - Addition(`+`)
        - String Concatenation(`"a" + "b"`)
    - Substraction(`-`)
    - Multiplication(`*`)
    - Division(`/`)
    - Disallowing Overflow
    - Remainder Operator(`%`)
    - Unary Minus Operator
    - Unary Plus Operator

- Compound Assignment Operators
    - Combine Assignment (`=`) with Another Operation
    - `++` is not supported in Swift

> **Note**                       
For a complete list of the compound assignment operators provided by the Swift standard library, see *[Swift Standard Library Operators Reference](https://developer.apple.com/reference/swift/swift_standard_library_operators)*.

- Comparison Operators
    - Swift supports all standard C comparison operators
        - Equal to (`a == b`)
        - Not equal to (`a != b`)
        - Greater than (`a > b`)
        - Less than (`a < b`)
        - Greater than or equal to (`a >= b`)
        - Less than or equal to (`a <= b`)
    - Swift also provides two identity operators (`===` and `!==`) for object Comparison
    - Tuple Comparison

- Ternary Conditional Operator
    - Form: `question ? answer1 : answer2`
    - Use the ternary conditional operator with care

- Nil-Coalescing Operator
    - Form: `a ?? b`
    - Underlying Expression: ` a != nil ? a! : b`

- Range Operators
    - Closed Range Operator(`a...b`)
    - Half-Open Range Operator(`a..<b`)

- Logical Operators
    - Logical operators modify or combine the **Boolean** logic values true and false
    - Logical NOT Operator(`!a`)
    - Logical AND Operator(`a && b`)
    - Logical OR Operator(`a || b`)
    - Combining Logical Operators: The Swift logical operators `&&` and `||` are left-associative
    - Readability is always preferred over brevity, use parentheses where they help to make your intentions clear

## [Strings and Characters](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID285)
- Overview
    - What is String
    - Unicode-compliant
    - Lightweight and Readable in Syntax
    - String Concatenation
    - String Interpolation
    - Every string is composed of encoding-independent Unicode characters
    - Swift’s String type is bridged with Foundation’s NSString class

- String Literals

- Initializing an Empty String
    - Assign an empty string literal to a variable(`var emptyString = ""`)
    - Initialize a new `String` instance with initializer syntax(`var anotherEmptyString = String()`)

- String Mutability
    - Variable -> Mutable(`var variableString = "Horse"`)
    - Constant -> Immutable(`let constantString = "Highlander"`)

- Strings Are Value Types
    - Copy-by-default String behavior
    - Swift’s compiler optimization on copying

- Working with Characters
    - String -> Characters：Access the individual `Character` values by `String`'s property `characters`
    - Characters -> String: `String` values can be constructed by passing an array of Character values as an argument to its initializer

- Concatenating Strings and Characters
    - Add `String` values together with operator `+`
    - Append a `String` value to a `String` by using operator `+=`
    - Append a `Character` value to a `String` bu using `append()` method

- String Interpolation
    > “*String interpolation* is a way to construct a new `String` value from a mix of constants, variables, literals, and expressions by including their values inside a string literal. "

- Unicode
    - What is Unicode?
        > Unicode is an international standard for encoding, representing, and processing text in different writing systems. It enables you to represent almost any character from any language in a standardized form, and to read and write those characters to and from an external source such as a text file or web page. 
    - Unicode Scalars
        - Swift’s native String type is built from Unicode scalar values
        - A Unicode scalar is a unique 21-bit number for a character or modifier
    - Special Characters in String Literals
        - String literals can include the following special characters
            - The escaped special characters `\0` (null character), `\\` (backslash), `\t` (horizontal tab), `\n` (line feed), `\r` (carriage return), `\"` (double quote) and `\'` (single quote)
            - An arbitrary Unicode scalar, written as `\u{n}`, where `n` is a 1–8 digit hexadecimal number with a value equal to a valid Unicode code point
    - Extended Grapheme Clusters
        - Every instance of Swift’s `Character` type represents a single extended grapheme cluster
        - An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character

- Counting Characters
    - To retrieve a count of the Character values in a string, use the count property of the string’s characters property
    - Swift’s use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string’s character count

- Accessing and Modifying a String
    - String Indices
        - Each `String `value has an associated index type, `String.Index`, which corresponds to the position of each `Character` in the string
        - Swift strings cannot be indexed by integer values
        - Properties and Methods: `endIndex`, `startIndex`, `indices`, `index(before:)`, `index(after:)`, `index(_:offsetBy:)`
    - Inserting and Removing
        - Methods: `insert(_:at:)`, `insert(contentsOf:at:)`, `remove(at:)`, `removeSubrange(_:)`

- Comparing Strings
    - String and Character Equality(`==`, `!=`)
    - Prefix and Suffix Equality(` hasPrefix(_:)`, `hasSuffix(_:)`)
    > Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent. Extended grapheme clusters are canonically equivalent if they have the same linguistic meaning and appearance, even if they are composed from different Unicode scalars behind the scenes.
- Unicode Representations of Strings
    - UTF-8 Representation
    - UTF-16 Representation
    - Unicode Scalar Representation

## [Collection Types](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105)
- Generic Collections
    - What is generic type
- Mutability of Collections
    - Variable -> Mutable
    - Constant -> Immutable
    - It is good practice to create immutable collections in all cases where the collection does not need to change
- Arrays
    - Swift’s `Array` type is bridged to Foundation’s `NSArray` class.
    - Array Type Shorthand Syntax
        - Array type: `Array<Element>`
        - Array Type Shorthand: `[Element]`
    - Creating an Empty Array(`var someInts = [Int]()`)

    - Creating an Array with a Default Value(`var threeDoubles = Array(repeating: 0.0, count: 3)`)
    - Creating an Array by Adding Two Arrays Together
        - Using addition operator (+)
    - Creating an Array with an Array Literal(`[value 1, value 2, value 3]`)
    - Accessing and Modifying an Array
        - `count`
        - `isEmpty`
        - `append(_:)` : add new item
        - `+=` :  append an array
        - `var firstItem = shoppingList[0]`:
        - `shoppingList[0] = "Six eggs"`
        - `shoppingList[4...6] = ["Bananas", "Apples"]`
        - `shoppingList.insert("Maple Syrup", at: 0)`
        - `let mapleSyrup = shoppingList.remove(at: 0)`
        - `let apples = shoppingList.removeLast()`
    - Iterating Over an Array
        - Normal Iteration
        - `enumerated()` method

- Sets
    - Swift’s `Set` type is bridged to Foundation’s `NSSet` class.
    - Hash Values for Set Types: A type must be hashable in order to be stored in a set
    - Set Type Syntax: `Set<Element>`
    - Creating and Initializing an Empty Set(`var letters = Set<Character>()`)
    - Creating a Set with an Array Literal(`var favoriteGenres: Set<String> = ["Rock”]`)
    - Accessing and Modifying a Set
        - `count`
        - `isEmpty`
        - `insert(_:)`
        - `remove(_:)`
        - `removeAll()`
        - `contains(_:)`
    - Iterating Over a Set
        -  use the `sorted()` method

- Performing Set Operations
    - Fundamental Set Operations
        - `intersection(_:)` 
        - `symmetricDifference(_:)` 
        - `union(_:)`
        - `subtracting(_:)`
    - Set Membership and Equality
        - “is equal” operator (`==`) 
        - `isSubset(of:)`
        - `isSuperset(of:)`
        - `isStrictSubset(of:)` and `isStrictSuperset(of:)`
        - `isDisjoint(with:)`

- Dictionaries
    - Swift’s `Dictionary` type is bridged to Foundation’s `NSDictionary` class.
    - Dictionary Type Shorthand Syntax
        - Full form: `Dictionary<Key, Value>`
        - Shorthand form: `[Key: Value]`
    - Creating an Empty Dictionary(`var namesOfIntegers = [Int: String]()`)
    - Creating a Dictionary with a Dictionary Literal(`[key 1: value 1, key 2: value 2, key 3: value 3]`)
    - Accessing and Modifying a Dictionary
        - `count`
        - `isEmpty`
        - `airports["LHR"] = "London"`
        - `updateValue(_:forKey:) `
        - `let airportName = airports["DUB"]`
        - `airports["DUB"] = nil`
        - `removeValue(forKey:)`
    - Iterating Over a Dictionary
        - iterate over the key-value pairs in a dictionary with a for-in loop
        - `keys` and `values`
        - `sorted()`


## [Control Flow](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID120)
- For-In Loops
    - Usage: Iterate over a sequence, such as ranges of numbers, items in an array, or characters in a string
    - Ignore the values by using an underscore in place of a variable name

- While Loops
    - `While`
    - `Repeat-While`

- Conditional Statements
    - If
    - Switch
        - No Implicit Fallthrough
            - `switch` statements not fall through the bottom of each case and into the next one by default.
            - The body of each case must contain at least one executable statement.
        - Interval Matching(`case: 1..<5:`)
        - Tuples
            - Wild pattern: underscore character (`case (_, 0):`)
            - If multiple matches are possible, the first matching case is always used.
        - Value Bindings(`case (0, let y):`)
        - Where(`case let (x, y) where x == y:`)
        - Compound Cases(`case "a", "e":`)

- Control Transfer Statements
    - Continue
    - Break
        - Break in a Loop Statement
        - Break in a Switch Statement
            > Because Swift’s switch statement is exhaustive and does not allow empty cases, it is sometimes necessary to deliberately match and ignore a case in order to make your intentions explicit. You do this by writing the break statement as the entire body of the case you want to ignore.
    - Fallthrough
        > Note: The fallthrough keyword does not check the case conditions for the switch case that it causes execution to fall into. 
    - Labeled Statements
        -  if you have multiple nested loops, it can be useful to be explicit about which loop the continue statement should affect.
        - Usage: mark a loop statement or conditional statement with a statement label. 
- Early Exit
    - You use a `guard` statement to require that a condition must be true in order for the code after the guard statement to be executed.
    - Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the `guard` statement appears in.
- Checking API Availability
    - Availability condition: `if #available(platform name version, ..., *)`

## Functions
## Closures
## Enumerations
## Classes and Structures
## Properties
## Methods
## Subscripts
## Inheritance
## Initialization
## Deinitialization
## Automatic Reference Counting
## Optional Chaining
## Error Handling
## Type Casting
## Nested Types
## Extensions
## Protocols
## Generics
## Access Control
## Advanced Operators

