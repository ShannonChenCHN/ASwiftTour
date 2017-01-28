//
//  Contact.swift
//  Contacts
//
//  Created by ShannonChen on 2017/1/27.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import Foundation

class Contact: NSObject {
    // MARK: Properties
    let firstName: String?
    let lastName: String?
    let fullName: String
    
    
    
    init?(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = "\(firstName) \(lastName)"
        if fullName.isEmpty {
            return nil
        }
        super.init()
    }
    
}
