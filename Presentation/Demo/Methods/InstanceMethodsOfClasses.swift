//
//  InstanceMethodsOfClasses.swift
//  Methods
//
//  Created by ShannonChen on 2019/7/10.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation



class Counter {

    var count = 0
    
    func incremnt() {
        count += 1
    }
    
    func incremnt(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }

}


func createACounter() {
    let counter = Counter()
    counter.incremnt()
    counter.incremnt(by: 5)
    counter.reset()

    
}


