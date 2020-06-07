//
//  SwiftLibB.swift
//  SwiftLibB
//
//  Created by ShannonChen on 2020/3/28.
//  Copyright © 2020 ShannonChen. All rights reserved.
//

import Foundation
import ObjCLibB

@objcMembers
public class SwiftLibB: NSObject {

    public func sayHello(name: String) {
        ObjCLibB().sayHello()
        print("Hello, this is " + name + "!")
        print("-- Printed by SwiftLibB")
    }
}
