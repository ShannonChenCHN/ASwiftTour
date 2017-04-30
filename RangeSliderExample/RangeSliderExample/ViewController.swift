//
//  ViewController.swift
//  RangeSliderExample
//
//  Created by ShannonChen on 2017/4/27.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

/**
 https://www.raywenderlich.com/76433/how-to-make-a-custom-control-swift
 
 Notes:
 1. Choose a existing class for custom control to subclass or extend. You’ll be using the target-action pattern in this custom control, so UIControl will serve as a great starting point.
 
 2. Before you write any code for your control, you should add your control to the view controller so that you can watch the evolution of the control.
 
 3. API Design: Before you add the visual elements to your control, you’ll need a few properties to keep track of the various pieces of information that are stored in your control.
 
 4. Well-designed controls should define some default property values.
 
 5. Images vs. CoreGraphics
    5.1 Images: Simple to use,  but it’s difficult to modify the control from code.
    5.2 Core Graphics: More flexible, but you have to write the rendering code yourself.
    5.3 Apple tend to opt for using images in their controls.
 
 6. Adding Interactive Logic: store which thumb is being dragged, and reflect that in the UI.
 
 7. Adding Touch Handlers: add the ability for the user to drag the slider thumbs around.
    7.1 UIControl provides several methods for tracking touches, so we can override these methods to add interaction logic.
    7.2 beginTrackingWithTouch::
    7.3 continueTrackingWithTouch::
    7.4 endTrackingWithTouch::
 
 8. Change Notifications
    - NSNotification, Key-Value-Observing (KVO): If you look at the UIKit controls, you’ll find they don’t use NSNotification or encourage the use of KVO, so for consistency with UIKit you can exclude those two options.
    - the delegate pattern: 
        - A protocol can contain a number of methods.
        - A delegate method can take any number of parameters.
        - A control only accept a single delegate instance.
    - the target-action pattern: 
        - The target-action pattern is provided by the UIControl base class. 
        - You can provide multiple targets to control actions.
        - while it is possible to create custom events (see UIControlEventApplicationReserved) the number of custom events is limited to 4.
        - Control actions do not have the ability to send any information with the event.
    - The key differences between the above two patterns are as follows:
        - Multicast: `one-to-one` vs. `one-to-many`
        - Flexibility: `can pass extra information` vs. `cannot pass extra information directly`
 
 9. Modifying Your Control With Core Graphics: override `draw(in:)` method
 
 10. Handling Changes to Control Properties: implement property observers that update the control’s frame or drawing.
 
 11. Test:
    When you are developing a custom control, it’s your responsibility to exercise all of its properties and visually verify the results. 
    A good way to approach this is to create a visual test harness with various buttons and sliders, each of which connected to a different property of the control. 
    That way you can modify the properties of your custom control in real time — and see the results in real time.
 
 12. Where To Go From Here?
    - Documentation: A good practice is to provide public API documentation, at a minimum, for all publicly shared code. This means documenting all public classes and properties.
 
    - Robustness: You need to ensure that the control state always remains valid — despite what some silly coder tries to do to it.
 
    - API Design: Creating a flexible, intuitive and robust API will ensure that your control can be widely used, as well as wildly popular. See Matt Gemmell’s 25 rules of API design http://www.mattgemmell.com/api-design/
    
    - Sharing: GitHub, CocoaPods, Cocoa Controls https://www.cocoacontrols.com
 */

class ViewController: UIViewController {
    let rangeSlider = RangeSlider(frame:CGRect())
    

    override func viewDidLoad() {
        super.viewDidLoad()

        rangeSlider.addTarget(self, action:#selector(rangeSliderValueChanged(rangeSlider:)), for: .valueChanged)
        view.addSubview(rangeSlider)
        
        // Grand Central Dispatch (GCD) and Dispatch Queues in Swift 3 http://www.appcoda.com/grand-central-dispatch/
        let deadline = DispatchTime.now() + DispatchTimeInterval.seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadline) { 
            self.rangeSlider.trackHighlightTintColor = UIColor.red
            self.rangeSlider.curvaceousness = 0.0
        }
        
        // You could see that UISlider uses images to configure appearance from API and `View hierarchy debug tool`
        let slider = UISlider.init(frame: CGRect.init(x: 30, y: 100, width: 300, height: 100))
        view.addSubview(slider)
    }
    
    
    override func viewDidLayoutSubviews() {
        
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        // MARK: What is topLayoutGuide??
        rangeSlider.frame = CGRect.init(x: margin, y: topLayoutGuide.length + margin, width: width, height: 31.0)
        
    }
    
    func rangeSliderValueChanged(rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))")
    }

}

