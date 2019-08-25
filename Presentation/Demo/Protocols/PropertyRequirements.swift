//
//  PropertyRequirements.swift
//  Protocols
//
//  Created by ShannonChen on 2019/8/25.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


protocol FullyNamed {
    var fullName: String {
        get
    }
}

struct Person: FullyNamed {
    var fullName: String
    
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}


func runExample01() {
    
    let john = Person.init(fullName: "John Appleseed")
    print(john.fullName)
    
    var ncc1701 = Starship.init(name: "Enterprise", prefix: "USS")
    print(ncc1701.fullName)
}

