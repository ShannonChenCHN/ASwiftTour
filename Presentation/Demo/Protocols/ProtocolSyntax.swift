//
//  ProtocolSyntax.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

//--------------------- Define Protocols ---------------------

protocol FirstProtocol {
    // protocol definition goes here
}

protocol AnotherProtocol {
    // protocol definition goes here
}


//--------------------- Define custom types ---------------------

struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}

class SomeSuperClass {
    // class definition goes here
    
    init() {
        
    }
}

/* “If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma”
 */
class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol /* SomeSuperClass */ {
    // class definition goes here
}

//--------------------- properties and methods --------------------

protocol SomeProtocol {
    
    // gettable and settable property
    var mustBeSettable: Int { get set }
    
    // gettable property
    var doesNotNeedToBeSettable: Int { get }
    
    // type property
    static var someTypeProperty: Int {
        get set
    }
    
    // method
    func someMethod()
    
    // type method
    static func someTypeMethod()
    
    // initializer
    init(someParameter: Int)
    init()
}
