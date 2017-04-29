//
//  RangeSliderTrackLayer.swift
//  RangeSliderExample
//
//  Created by ShannonChen on 2017/4/29.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class RangeSliderTrackLayer: CALayer {
    weak var rangeSlider: RangeSlider?
    
    // TODO: Why do we override is this method
    // TODO: Core Graphics
    override func draw(in ctx: CGContext) {
        
        if let slider = rangeSlider {
            
            // Clip
            let cornerRadius = bounds.height * 0.5 * slider.curvaceousness
            let path = UIBezierPath.init(roundedRect: bounds, cornerRadius: cornerRadius)
            ctx.addPath(path.cgPath)
            
            // Fill the track
            ctx.setFillColor(slider.trackTintColor.cgColor)
            ctx.addPath(path.cgPath)
            ctx.fillPath()
            
            
            // Fill the highlighted range
            ctx.setFillColor(slider.trackHighlightTintColor.cgColor)
            let lowerValuePosition = CGFloat(slider.positionForValue(value: slider.lowerValue))
            let upperValuePosition = CGFloat(slider.positionForValue(value: slider.upperValue))
            let rect = CGRect.init(x: lowerValuePosition, y: 0.0, width: upperValuePosition - lowerValuePosition, height: bounds.height)
            ctx.fill(rect)
            
        }

    }
}
