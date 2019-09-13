//
//  main.swift
//  ReferenceType
//
//  Created by ShannonChen on 2019/9/8.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

class Temperature: NSObject, NSCopying {
    var celsius: Double = 0
    var fahrenheit: Double {
        get { return celsius * 9 / 5 + 32}
        set { celsius = (newValue - 32) * 5 / 9 }
    }
    
    init(celsius: Double) {
        self.celsius = celsius
    }
    
        func copy(with zone: NSZone? = nil) -> Any {
            let copy = Temperature(celsius: celsius)
            return copy
        }
    
}


/// 空调
class Thermostat {
    var temperature = Temperature(celsius: 0)
    //    var _temperature = Temperature(celsius: 0)
    //
    //    var temperature: Temperature {
    //        get { return _temperature }
    //        set { _temperature = newValue.copy() as! Temperature}
    //    }
    
    func turnUp() {
        
    }
    func turnDown() {
        
    }
}

/// 烤箱
class Oven {
    var temperature = Temperature(celsius: 0)
    
    //    var _temperature = Temperature(celsius: 0)
    //
    //       // Defensive Copying
    //    var temperature: Temperature {
    //        get { return _temperature }
    //        set { _temperature = newValue.copy() as! Temperature}
    //    }
    
    
    func bake() {
        
    }
}


/// 房子
class House {
    var thermostat = Thermostat()
    var oven = Oven()
}

let home = House()
let temp = Temperature(celsius: 0)
temp.fahrenheit = 75
home.thermostat.temperature = temp.copy() as! Temperature // manual copying

temp.fahrenheit = 425
home.oven.temperature = temp.copy() as! Temperature
home.oven.bake()


