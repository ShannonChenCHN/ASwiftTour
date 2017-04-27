//
//  ViewController.swift
//  RangeSliderExample
//
//  Created by ShannonChen on 2017/4/27.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

/**
 Notes:
 1. Choose a existing class for custom control to subclass or extend. You’ll be using the target-action pattern in this custom control, so UIControl will serve as a great starting point.
 2. Before you write any code for your control, you should add your control to the view controller so that you can watch the evolution of the control.
 3. API Design: Before you add the visual elements to your control, you’ll need a few properties to keep track of the various pieces of information that are stored in your control.
 4. Well-designed controls should define some default property values.
 5. Images vs. CoreGraphics
 */

class ViewController: UIViewController {
    let rangeSlider = RangeSlider(frame:CGRect())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rangeSlider.backgroundColor = UIColor.red
        view.addSubview(rangeSlider)
    }
    
    
    override func viewDidLayoutSubviews() {
        
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        // MARK: What is topLayoutGuide??
        rangeSlider.frame = CGRect.init(x: margin, y: topLayoutGuide.length + margin, width: width, height: 31.0)
        
    }

}

