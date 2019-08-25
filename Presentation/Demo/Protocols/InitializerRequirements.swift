//
//  InitializerRequirements.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


class AnotherClass: SomeSuperClass, SomeProtocol {
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


//----------------------  Required Initializer ---------------------------

class A {
    required init() {
        
    }
}

class B: A {
//    // 'required' modifier must be present on all overrides of a required initializer
//    init() {
//
//    }
}
