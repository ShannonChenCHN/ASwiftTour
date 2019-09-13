//
//  Polygon.swift
//  ValueTypesInPractice
//
//  Created by ShannonChen on 2019/9/13.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import UIKit


struct Polygon: Equatable {
    var corners: [CGPoint] = []
    
    static func ==(lhs: Polygon, rhs: Polygon) -> Bool {
        return lhs.corners == rhs.corners
    }
}

extension Polygon: Drawable {
    func draw() {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.move(to: corners.last!)
        for point in corners {
            ctx?.move(to: point)
        }
        ctx?.closePath()
        ctx?.strokePath()
    }
    
}

extension Polygon {
    var path: BezierPath {
        let result = UIBezierPath()
        result.move(to: corners.last!)
        for point in corners {
            result.addLine(to: point)
        }
        return BezierPath(path: result)
    }
}
