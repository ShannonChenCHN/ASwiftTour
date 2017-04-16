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

> Reference               
> For a complete list of the compound assignment operators provided by the Swift standard library, see *[Swift Standard Library Operators Reference](https://developer.apple.com/reference/swift/swift_standard_library_operators)*.

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

## Strings and Characters
## Collection Types
## Control Flow
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

