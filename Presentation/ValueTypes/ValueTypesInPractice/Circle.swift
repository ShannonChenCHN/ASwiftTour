//
//  Circle.swift
//  ValueTypesInPractice
//
//  Created by ShannonChen on 2019/9/13.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import UIKit


struct Circle: Equatable {
    var center: CGPoint
    var radius: CGFloat
    init(center: CGPoint, radius: CGFloat) {
        self.center = center
        self.radius = radius
    }

    static func ==(lhs: Circle, rhs: Circle) -> Bool {
        return lhs.center == rhs.center && lhs.radius == rhs.radius
    }
}

extension Circle: Drawable {
    func draw() {
        let arc = CGMutablePath()
        arc.addArc(center: center, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
    }
    
}
