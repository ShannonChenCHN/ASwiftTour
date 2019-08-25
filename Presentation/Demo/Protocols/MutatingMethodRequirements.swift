//
//  MutatingMethodRequirements.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


protocol Togglable {
    
    // The mutating keyword is only used by structures and enumerations.
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}


func runExample03() {
    var lightSwitch = OnOffSwitch.off
    lightSwitch.toggle()
}



