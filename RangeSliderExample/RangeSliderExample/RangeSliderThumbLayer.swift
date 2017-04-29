//
//  RangeSliderThumbLayer.swift
//  RangeSliderExample
//
//  Created by ShannonChen on 2017/4/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class RangeSliderThumbLayer: CALayer {
    
    var highlighted: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    weak var rangeSlider: RangeSlider?
    
    
    override func draw(in ctx: CGContext) {
        
        if let slider = rangeSlider {
            
            let thumbFrame = bounds.insetBy(dx: 2.0, dy: 2.0)
            let cornerRadius = thumbFrame.height * slider.curvaceousness / 2.0
            let thumbPath = UIBezierPath.init(roundedRect: thumbFrame, cornerRadius: cornerRadius)
            
            // Fill - with a subtle shadow
            let shadowColor = UIColor.gray
            let shadowOffset = CGSize.init(width: 0.0, height: 1.0)
            ctx.setShadow(offset: shadowOffset, blur: 1.0, color: shadowColor.cgColor)
            ctx.setFillColor(slider.thumbTintColor.cgColor)
            ctx.addPath(thumbPath.cgPath)
            ctx.fillPath()
            
            // Outline
            ctx.setStrokeColor(shadowColor.cgColor)
            ctx.setLineWidth(0.5)
            ctx.addPath(thumbPath.cgPath)
            ctx.strokePath()
            
            if highlighted {
                ctx.setFillColor(slider.thumbHighlightTintColor.cgColor)
                ctx.addPath(thumbPath.cgPath)
                ctx.fillPath()
            }
        }
    }
    
}
