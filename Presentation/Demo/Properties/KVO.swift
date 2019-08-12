//
//  KVO.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/15.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


/*
 Note: You can only use key-value observing with classes that
       inherit from `NSObject`.
 */

class MyObjectToObserve: NSObject {
    
    @objc dynamic var myDate = NSDate(timeIntervalSince1970: 0) // 1970
    
    func updateDate() {
        myDate = myDate.addingTimeInterval(Double(2 << 30)) // Adds about 68 years.
    }
}

class MyObserver: NSObject {
    
    @objc var objectToObserve: MyObjectToObserve
    var observation: NSKeyValueObservation?
    
    init(object: MyObjectToObserve) {
        objectToObserve = object
        super.init()
        
        observation = observe(
            \.objectToObserve.myDate,
            options: [.old, .new]
        ) { object, change in
            print("myDate changed from: \(change.oldValue!), updated to: \(change.newValue!)")
        }
    }
}


func runObserver() {
    let observed = MyObjectToObserve()
    let observer = MyObserver(object: observed)
    
    observed.updateDate() // Triggers the observer's change handler.
    // Prints "myDate changed from: 1970-01-01 00:00:00 +0000, updated to: 2038-01-19 03:14:08 +0000"
}
