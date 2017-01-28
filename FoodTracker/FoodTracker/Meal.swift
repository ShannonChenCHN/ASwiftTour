//
//  Meal.swift
//  FoodTracker
//
//  Created by ShannonChen on 2017/1/27.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meal")
    
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        // Initialization should fail if there is no name or the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
    // MARK: NScoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(photo, forKey: PropertyKey.photoKey)
        aCoder.encode(rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        //  Because if the object can’t be cast as a String, or if it’s nil, something has gone wrong and the error should cause a crash at runtime.
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        
        // Because the return value of decodeIntegerForKey is Int, there’s no need to downcast the decoded value.
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.ratingKey)
        
        
        self.init(name: name, photo: photo, rating: rating)
    }
}
