//
//  KVC.swift
//  CocoaDesignPatterns
//
//  Created by xianglongchen on 2019/11/21.
//  Copyright © 2019 ctrip. All rights reserved.
//

import Foundation

class Person: NSObject {
    @objc var name: String
    @objc var friends: [Person] = []
    @objc var bestFriend: Person? = nil
    
    init(name: String) {
        self.name = name
    }
    
    @objc func run() {
        print("🏃 run... 🏃")
    }
}
 
class KVCExample: NSObject {
    @objc static func run() {
        let gabrielle = Person(name: "Gabrielle")
        let jim = Person(name: "Jim")
        let yuanyuan = Person(name: "Yuanyuan")
        gabrielle.friends = [jim, yuanyuan]
        gabrielle.bestFriend = yuanyuan
         
        print(#keyPath(Person.name)) // "name"
        
        print(gabrielle.value(forKey: #keyPath(Person.name)) as? String ?? "") // "Gabrielle"
        
        print(#keyPath(Person.bestFriend.name)) // "bestFriend.name"
        
        print(gabrielle.value(forKeyPath: #keyPath(Person.bestFriend.name)) as? String ?? "")  // "Yuanyuan"
        
        print(#keyPath(Person.friends.name)) // "friends.name"
        
        print(gabrielle.value(forKeyPath: #keyPath(Person.friends.name)) as? String ?? "") // ["Yuanyuan", "Jim"]
        
        
        let action = #selector(Person.run)
        jim.perform(action)
    }
}


