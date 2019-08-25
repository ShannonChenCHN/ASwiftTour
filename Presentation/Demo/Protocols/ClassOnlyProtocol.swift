//
//  ClassOnlyProtocol.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


// `someClassOnlyProtocol` can only be adopted by class types
protocol SomeClassOnlyProtocol: AnyObject, FirstProtocol {
    
}


class ClassType: SomeClassOnlyProtocol {
    
}


// error: Non-class type 'StructType' cannot conform to class protocol 'SomeClassOnlyProtocol'
//struct StructType: SomeClassOnlyProtocol {
//
//}
