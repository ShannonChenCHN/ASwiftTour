//
//  KeyPath.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/15.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


struct Address {
    var street: String
    var city: String
    var zipCode: Int
}

struct Customer {
    let name: String
    var address: Address
}

func runKeyPathExample() {
    let streetKeyPath = \Customer.address.street // WritableKeyPath<Customer, String>
    let nameKeyPath = \Customer.name // KeyPath<Customer, String>
    
    let simpsonResidence = Address(street: "1094 Evergreen Terrace", city: "Springfield", zipCode: 97475)
    var lisa = Customer(name: "Lisa Simpson", address: simpsonResidence)
    let lisaNameKeyPath = lisa[keyPath: nameKeyPath] // Lisa Simpson
//    lisaNameKeyPath = "Zak" // this will report an error
    lisa[keyPath: streetKeyPath] = "742 Evergreen Terrace"
}


