//
//  main.swift
//  ASwiftTour
//
//  Created by ShannonChen on 2019/7/8.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


// Lazy stored properties
class DataImporter {
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a non-trivial amount of time to initialize.
     
     */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
    
}


class DataManager {
    lazy var imporer: Int? = foo()
    /*
     A lazy stored property is a property whose initial value is not calculated until the first time it is used.
     
     note: You must always declare a lazy property as a variable. Constant properties must always have a value before initialization completes, and therefore cannot be declared as lazy.
     */
    
    var data = [String]()
    // the DataManager class would provide data management functionality here
    
    func foo() -> Int {
        return 4
    }
    
}


func runDataManager() {
    let manager = DataManager()
    manager.data.append("Some data")
    manager.data.append("Some more data")
    // the DataImporter instance for the importer property has not yet been created
    print(manager.imporer)
manager.imporer = nil
    print(manager.imporer)
//    print("file \(manager.imporer.filename) has been imported\n")
}

