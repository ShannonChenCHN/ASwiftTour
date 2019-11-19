//
//  main.swift
//  AuditingPropertyAccess
//
//  Created by xianglongchen on 2019/11/13.
//  Copyright © 2019 ctrip. All rights reserved.
//

import Foundation



@propertyWrapper
struct Versioned<Value> {
    private var value: Value!
    private(set) var timestampedValues: [(Date, Value)] = []

    var wrappedValue: Value {
        get { value }

        set {
            defer { timestampedValues.append((Date(), value)) }
            value = newValue
        }
    }

    init(wrappedValue value: Value) {
        self.wrappedValue = value
    }
}


// map 的用法
// https://stackoverflow.com/questions/26536538/swift-get-an-array-of-element-from-an-array-of-tuples
let tuples = [(1, 2), (3, 4)]
let _ = tuples.map { (arg0/*: (Int, Int)*/) -> Int in
    
    let (a, _) = arg0
    return a
}

let _ = tuples.map { tuple in
    tuple.0
}

let _ = tuples.map { $0.0 }

class ExpenseReport {
    enum State {
        case submitted, received, approved, denied
    }

    @Versioned var state: State = .submitted {
        willSet {
            let hasSetDenied = (_state.timestampedValues.map { $0.1 }.contains(.denied))
            if hasSetDenied, newValue == .approved {
                // ⚠️ this particular example highlights a major limitation
                // in the current implementation of property wrappers that
                // stems from a longstanding deficiency of Swift generally:
                // Properties can’t be marked as throws
                // our best option is `fatalError()`
                fatalError("J'Accuse!")
            }
        }
    }
}
