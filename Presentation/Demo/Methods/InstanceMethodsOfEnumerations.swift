//
//  InstanceMethodsOfEnumerations.swift
//  Methods
//
//  Created by ShannonChen on 2019/7/10.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


// Mutating methods for enumerations can set the implicit self parameter to be a different case from the same enumeration

enum TriStateSwitch {
    case off, low, high
    
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
            
        }
    }
}

func createASwich() {
 
    var ovenLight = TriStateSwitch.low
    ovenLight.next()
    ovenLight.next()

}
