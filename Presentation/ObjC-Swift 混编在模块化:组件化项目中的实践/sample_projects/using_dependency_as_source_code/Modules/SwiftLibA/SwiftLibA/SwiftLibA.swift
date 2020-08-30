//
//  SwiftLibA.swift
//  SwiftLibA
//
//  Created by ShannonChen on 2020/3/26.
//  Copyright © 2020 ShannonChen. All rights reserved.
//

import Foundation
import SwiftLibB
import ObjCLibB

@objcMembers
public class SwiftLibA: NSObject {
    
    public func sayHello(name: String) {
        SwiftLibB().sayHello(name: name)
        ObjCLibB().sayHello()
        print("-- Printed by SwiftLibA")
    }
}
