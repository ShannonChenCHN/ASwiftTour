//
//  main.swift
//  ValueSemantics
//
//  Created by ShannonChen on 2019/9/8.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

struct Temperature: Equatable {
    var celsius: Double = 0
    var fahrenheit: Double {
        get { return celsius * 9 / 5 + 32 }
        set { celsius = (newValue - 32) * 5 / 9 }
    }

    static func ==(lhs: Temperature, rhs: Temperature) -> Bool {
        return lhs.celsius == rhs.celsius
    }

}

/// 空调
class Thermostat {
    var temperature = Temperature(celsius: 0)
    
    func turnUp() {
        
    }
    func turnDown() {
        
    }
}

/// 烤箱
class Oven {
    var temperature = Temperature(celsius: 0)
    
    func bake() {
        
    }
}


/// 房子
class House {
    var thermostat = Thermostat()
    var oven = Oven()
}

let home = House()
var temp = Temperature(celsius: 0)
temp.fahrenheit = 75
home.thermostat.temperature = temp // copy on write

temp.fahrenheit = 425
home.oven.temperature = temp
home.oven.bake()
