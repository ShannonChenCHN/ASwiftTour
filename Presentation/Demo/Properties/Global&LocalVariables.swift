//
//  Global&LocalVariables.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/10.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

/*
 
 you can also define computed variables and define observers for stored variables, in either a global or local scope. 
 */


func testVariables() {
    
//    var aNum: Int = 8
//    var computedVar: Int {
//        return aNum * 2
//    }
//    print(computedVar)
//    aNum = 10
//    print(computedVar)
//
//
//    var observedVar: Double = 1 {
//        willSet {
//            print(newValue)
//        }
//    }
//    observedVar = 8
//    print(observedVar)
    
    
    // 下面的 didSet 会被调用吗？
    var point = Point(x: 10, y: 10) {
        didSet {
            print("Point changed: \(point)")
        }
    }
    
    point.x = 20
    /*
     理解值类型的关键就是理解为什么这里会被调用。对结构体进行改变，在语义上来说，与重新 为它进行赋值是相同的。即使在一个更大的结构体上只有某一个属性被改变了，也等同于整个 结构体被用一个新的值进行了替代。在一个嵌套的结构体的最深层的某个改变，将会一路向上 反映到最外层的实例上，并且一路上触发所有它遇到的 willSet 和 didSet。
     */
    
    
    var person = Person(age: 20, sex: .female) {
        didSet {
            print("Person changed: \(person.age), \(person.sex)")
        }
    }
    person.age = 21
//    person = Person(age: 21, sex: .male)
}
