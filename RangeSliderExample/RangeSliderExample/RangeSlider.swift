//
//  RangeSlider.swift
//  RangeSliderExample
//
//  Created by ShannonChen on 2017/4/27.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class RangeSlider: UIControl {
    
    // MARK: Properties
    
    // Define properties for the state of this control, and set their default values.
    var minimumValue: Double = 0.0 {
        didSet {
            updateLayerFrames()
        }
    }
    var maximumValue: Double = 1.0 {
        didSet {
            updateLayerFrames()
        }
    }
    
    var lowerValue: Double = 0.2 {
        didSet {
            updateLayerFrames()
        }
    }
    var upperValue: Double = 0.8 {
        didSet {
            updateLayerFrames()
        }
    }
    
    // Properties for customization of the “look” of the control
    var trackTintColor: UIColor = UIColor.init(white: 0.9, alpha: 1.0) {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    
    var trackHighlightTintColor: UIColor = UIColor.init(red: 0.0, green: 0.45, blue: 0.94, alpha: 1.0) {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    var thumbTintColor: UIColor = UIColor.white {
        didSet {
            upperThumbLayer.setNeedsDisplay()
            lowerThumbLayer.setNeedsDisplay()
        }
    }
    var thumbHighlightTintColor: UIColor = UIColor.init(white: 0.0, alpha: 0.1) {
        didSet {
            upperThumbLayer.setNeedsDisplay()
            lowerThumbLayer.setNeedsDisplay()
        }
    }
    
    var curvaceousness: CGFloat = 1.0 {
        didSet {
            trackLayer.setNeedsDisplay()
            upperThumbLayer.setNeedsDisplay()
            lowerThumbLayer.setNeedsDisplay()
        }
    }
    
    
    // Three components of slider control
    // TODO: Why do use layers instead of views
    private let trackLayer = RangeSliderTrackLayer()
    private let upperThumbLayer = RangeSliderThumbLayer()
    private let lowerThumbLayer = RangeSliderThumbLayer()
    
    // Track the touch locations
    private var previousLocation = CGPoint()
    
    
    private var sliderTotalLength: Double {
        return Double(bounds.width - thumbWidth)
    }
    
    private var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }
    
    private var valueRangeLength: Double {
        return (maximumValue - minimumValue)
    }
    
    
    // Observe frame changing
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLayer.rangeSlider = self
        trackLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(trackLayer)
        
        upperThumbLayer.rangeSlider = self
        upperThumbLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(upperThumbLayer)
        
        lowerThumbLayer.rangeSlider = self
        lowerThumbLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(lowerThumbLayer)
        
        updateLayerFrames()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Setup frames
    func updateLayerFrames() {
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)  // This ensures that the changes to the frame for each layer are applied immediately, and not animated.
        
        
        // set trackLayer's frame
        trackLayer.frame = bounds.insetBy(dx: 0.0, dy: bounds.height / 3.0)
        trackLayer.setNeedsDisplay()
        
        // set upperThumbLayer's frame
        let upperThumbCenter = CGFloat.init(positionForValue(value: upperValue))
        upperThumbLayer.frame = CGRect.init(x: upperThumbCenter - thumbWidth / 2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        upperThumbLayer.setNeedsDisplay()
        
        // set lowerThumbLayer's frame
        let lowerThumbCenter = CGFloat.init(positionForValue(value: lowerValue))
        lowerThumbLayer.frame = CGRect.init(x: lowerThumbCenter - thumbWidth / 2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        lowerThumbLayer.setNeedsDisplay()
        
        
        CATransaction.commit()
    }
    
    func positionForValue(value: Double) -> Double {
        // (thumbValue - minimumValue) / (maximumValue - minimumValue)  = (thumbCenter - thumbWidth / 2) / (sliderWidth - thumbWidth)
        let percentage = (value - minimumValue) / valueRangeLength
        let startPoint = Double(thumbWidth / 2.0)               // TODO: type conversion
        
        return percentage * sliderTotalLength + startPoint
    }


    // MARK: Interactive Logic
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        
        // Hit test the thumb layers
        if lowerThumbLayer.frame.contains(previousLocation) {
            
            lowerThumbLayer.highlighted = true
            
        } else if upperThumbLayer.frame.contains(previousLocation) {
            
            upperThumbLayer.highlighted = true
            
        }
        
        return upperThumbLayer.highlighted || lowerThumbLayer.highlighted
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        
        // 1. Determine by how much the user has dragged
        // deltaLocation / sliderTotalLength = deltaValue / valueRangeLength
        let deltaLocation = Double.init(location.x - previousLocation.x)
        let deltaValue = valueRangeLength * deltaLocation / sliderTotalLength
        
        previousLocation = location
        
        // 2. Update the values
        if lowerThumbLayer.highlighted {
            
            lowerValue += deltaValue
            lowerValue = bound(value: lowerValue, toLowerValue: minimumValue, upperValue: upperValue)
            
        } else if upperThumbLayer.highlighted {
            upperValue += deltaValue
            upperValue = bound(value: upperValue, toLowerValue: lowerValue, upperValue: maximumValue)
        }
        
        // 3. Notify any subscribed targets of the changes
        sendActions(for: .valueChanged)
        
        return true
    }
    
    // TODO: How to name a function/method in Swift 3
    func bound(value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double {
        return min(max(value, lowerValue), upperValue)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        upperThumbLayer.highlighted = false
        lowerThumbLayer.highlighted = false
    }
}
