//
//  main.swift
//  TransformingValues
//
//  Created by xianglongchen on 2019/11/13.
//  Copyright © 2019 ctrip. All rights reserved.
//

import Foundation

/// A Property Wrapper that Trims Whitespace from String Values
@propertyWrapper
struct Trimmed {
    private(set) var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }

    init(wrappedValue value: String) {
        self.wrappedValue = value
    }
}

struct Post {
    @Trimmed var title: String
    @Trimmed var body: String
    
    
//    var title: String {
//        willSet {
//            title = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
//            /* ⚠️ Attempting to store to property 'title' within its own willSet,
//                   which is about to be overwritten by the new value              */
//        }
//    }
    
//    var title: String {
//        // 😓 Not called during initialization
//        didSet {
//            self.title = title.trimmingCharacters(in: .whitespacesAndNewlines)
//        }
//    }
}

var quine = Post(title: "  Swift Property Wrappers  ", body: "...")
print(quine.title) // "Swift Property Wrappers" (no leading or trailing spaces!)

quine.title = "      @propertyWrapper     "
print(quine.title) // "@propertyWrapper" (still no leading or trailing spaces!)
