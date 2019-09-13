//
//  Diagram.swift
//  ValueTypesInPractice
//
//  Created by ShannonChen on 2019/9/13.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

struct Diagram: Drawable {
    var items: [Drawable] = []
    
    mutating func addItem(item: Drawable) {
        items.append(item)
    }
    
    func draw() {
        for item in items {
            item.draw()
        }
    }

}

//extension Diagram: Equatable {
//    static func ==(lhs: Diagram, rhs: Diagram) -> Bool {
//        return lhs.items == rhs.items
//    }
//}
