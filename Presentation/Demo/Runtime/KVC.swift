//
//  KVC.swift
//  Runtime
//
//  Created by ShannonChen on 2019/7/15.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


class Person: NSObject {
    @objc var name: String
    @objc var friends: [Person] = []
    @objc var bestFriend: Person? = nil
    
    init(name: String) {
        self.name = name
    }
}

func runKeyPathExample() {
    
    let gabrielle = Person(name: "Gabrielle")
    let jim = Person(name: "Jim")
    let yuanyuan = Person(name: "Yuanyuan")
    gabrielle.friends = [jim, yuanyuan]
    gabrielle.bestFriend = yuanyuan
    
    
    print(gabrielle.value(forKey: #keyPath(Person.name)) ?? "")
    
    print(gabrielle.value(forKeyPath: #keyPath(Person.bestFriend.name)) ?? "")
    
    print(gabrielle.value(forKeyPath: #keyPath(Person.friends.name)) ?? "")
    
}
