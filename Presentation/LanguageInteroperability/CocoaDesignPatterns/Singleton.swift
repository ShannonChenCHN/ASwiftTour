//
//  Singleton.swift
//  CocoaDesignPatterns
//
//  Created by xianglongchen on 2019/11/21.
//  Copyright © 2019 ctrip. All rights reserved.
//

import Foundation


class Singleton {
    // 1.
//    static let sharedInstance = Singleton()
    
    // 2.
    static let sharedInstance: Singleton = {
        let instance = Singleton()
        // setup code
        return instance
    }()
}
