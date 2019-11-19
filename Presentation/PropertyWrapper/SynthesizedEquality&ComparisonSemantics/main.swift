//
//  main.swift
//  SynthesizedEquality&ComparisonSemantics
//
//  Created by xianglongchen on 2019/11/13.
//  Copyright © 2019 ctrip. All rights reserved.
//

import Foundation



 
/// a case-insensitive property wrapper.
///
/// Since Swift 4, the compiler automatically synthesizes Equatable conformance to types that adopt it in their declaration
///  and whose stored properties are all themselves Equatable. Because of how compiler synthesis is implemented (at least currently),
///  wrapped properties are evaluated through their wrapper rather than their underlying value:
///  ```
///  // Synthesized by Swift Compiler
///  extension Account: Equatable {
///     static func == (lhs: Account, rhs: Account) -> Bool {
///         lhs.$name == rhs.$name
///     }
///  }
///  ```
@propertyWrapper
struct CaseInsensitive<Value: StringProtocol> {
    var wrappedValue: Value
}

extension CaseInsensitive: Comparable {
    private func compare(_ other: CaseInsensitive) -> ComparisonResult {
        wrappedValue.caseInsensitiveCompare(other.wrappedValue)
    }

    static func == (lhs: CaseInsensitive, rhs: CaseInsensitive) -> Bool {
        lhs.compare(rhs) == .orderedSame
    }

    static func < (lhs: CaseInsensitive, rhs: CaseInsensitive) -> Bool {
        lhs.compare(rhs) == .orderedAscending
    }

    static func > (lhs: CaseInsensitive, rhs: CaseInsensitive) -> Bool {
        lhs.compare(rhs) == .orderedDescending
    }
}


let hello: String = "hello"
let HELLO: String = "HELLO"

print(hello == HELLO) // false
print(CaseInsensitive(wrappedValue: hello) == CaseInsensitive(wrappedValue: HELLO)) // true


struct Account: Equatable {
    @CaseInsensitive var name: String

    init(name: String) {
//        self.name = name
        // https://stackoverflow.com/questions/57555325/how-to-get-the-property-wrapper-value-with
        _name = CaseInsensitive(wrappedValue: name)
    }
}

var johnny = Account(name: "johnny")
let JOHNNY = Account(name: "JOHNNY")
let Jane = Account(name: "Jane")

print(johnny == JOHNNY) // true
print(johnny == Jane) // false

print(johnny.name == JOHNNY.name) // false

johnny.name = "Johnny"
print(johnny.name) // "Johnny"
