//
//  RatingControl.swift
//  FoodTracker
//
//  Created by ShannonChen on 2017/1/27.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let starCount = 5
    let spacing = 5
    

    // MARK: Initializtion
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let emptyStarImage = UIImage(named: "emptyStar")
        let filledStarImage = UIImage(named: "filledStar")
        
        
        
        for _ in 0..<starCount {
            
            let button = UIButton()
            
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.selected, .highlighted])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height
        let buttonDimension = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonDimension, height: buttonDimension)
        
        // Offset each button's origin by the length of button plus some spacing
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (spacing + buttonDimension))
            button.frame = buttonFrame
        }
        
        updatebuttonSelectionState()
    }
    
    override var intrinsicContentSize: CGSize {  // TODO: 重写父类方法？
        let buttonDimension = Int(frame.size.height)
        let width = (buttonDimension * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonDimension)
    }
    
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.index(of: button)! + 1
    }
    
    func updatebuttonSelectionState() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
        }
        
        
    }
    
}
