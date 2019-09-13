//
//  main.swift
//  Immutability
//
//  Created by ShannonChen on 2019/9/8.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

class Temperature {
    let celsius: Double
    var fahrenheit: Double {
        get { return celsius * 9 / 5 + 32}
    }
    
    init(celsius: Double) {
        self.celsius = celsius
    }
    init(fahrenheit: Double) {
        self.celsius = (fahrenheit - 32) * 5 / 9
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
home.thermostat.temperature = Temperature(celsius: 10.0)
//home.thermostat.temperature.celsius += 10.0
let temp = home.thermostat.temperature
home.thermostat.temperature = Temperature(celsius: temp.celsius + 10.0)
// 其实如果严格按照 Immutablity 的要求的话，除了 Temperature 之外，其他的 class 的属性也都要改成 let 了，这样的话，修改状态将会变得非常麻烦
