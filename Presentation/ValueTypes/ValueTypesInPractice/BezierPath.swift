//
//  BezierPath.swift
//  ValueTypesInPractice
//
//  Created by ShannonChen on 2019/9/13.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import UIKit

struct BezierPath: Drawable {
    private var _path = UIBezierPath()
    
    var pathForReading: UIBezierPath {
        return _path
    }
    
    var pathForWriting: UIBezierPath {
        mutating get {
            _path = _path.copy() as! UIBezierPath
            return _path
        }
    }
    
    init(path: UIBezierPath) {
        _path = path
    }
    
    func draw() {
        //...
    }
    
}

extension BezierPath {
    var isEmpty: Bool {
        return pathForReading.isEmpty
    }
    
    mutating func addLine(to point: CGPoint) {
        pathForWriting.addLine(to: point)
    }
    
    mutating func move(to point: CGPoint) {
        pathForWriting.move(to: point)
    }
}
