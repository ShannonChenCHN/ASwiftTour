//
//  PropertyObservers.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/9.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

/*
 
 Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.
 
 Q: How do I overwrite the getter of stored property in Swift?
 
 */

class StepCounter {
    var totalSteps: Int = 1 {
//        willSet {
//            print("About to set totalSteps to \(newValue)")
//        }
        willSet(newTotalSteps) {
            print("StepCounter: About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("StepCounter: Added \(totalSteps - oldValue) steps")
            }
        }
    }
}


class MyStepCounter: StepCounter {
    override var totalSteps: Int {
        willSet {
            print("MyStepCounter: About to set totalSteps to \(newValue)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("MyStepCounter: Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

func createStepCounter() {
//    let stepCounter = StepCounter()
//    stepCounter.totalSteps = 200
    
    var step = MyStepCounter()
    step.totalSteps = 56
    
//    changeSteps(steps: &step.totalSteps)
//    print(step.totalSteps)
    /*
 
     If you pass a property that has observers to a function as an in-out parameter, the willSet and didSet observers are always called.
 */
}


func changeSteps(steps: inout Int) {
    steps = 70
}


