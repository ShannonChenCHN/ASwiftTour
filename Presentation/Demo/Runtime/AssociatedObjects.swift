//
//  AssociatedObjects.swift
//  Runtime
//
//  Created by ShannonChen on 2019/7/15.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

extension NSDate {
    private struct AssociatedKeys {
        static var DescriptiveName = "DescriptiveName"
//        static var AnotherKey = "AnotherKey"
    }
    
//    var descriptiveName = ""
    var descriptiveName: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName) as? String
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.DescriptiveName,
                    newValue as NSString?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
}

func runAssociatedObjectsExample() {
    let date = NSDate(timeIntervalSince1970: 0)
    date.descriptiveName = "Beijing"
    if let name = date.descriptiveName {
        print(name)
    }
    
}
