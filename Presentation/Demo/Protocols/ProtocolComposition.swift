//
//  ProtocolComposition.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation



protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct PersonInfo: Named, Aged {
    var name: String
    var age: Int
}

// The type of `celebrator` parameter is `Named & Aged`, which means "any type that conforms to both the `Named` and `Aged` protocols.
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}


func runExample11() {
    let birthdayPerson = PersonInfo.init(name: "Malcolm", age: 21)
    wishHappyBirthday(to: birthdayPerson)
}



//________________________________________________________________________

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

/*
 “In addition to its list of protocols, a protocol composition can also contain one class type”
 */
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}


func runExample12() {
    let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
    beginConcert(in: seattle)
}
