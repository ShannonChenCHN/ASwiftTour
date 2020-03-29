//
//  MyViewController.swift
//  LanguageInteroperability
//
//  Created by xianglongchen on 2019/11/21.
//  Copyright © 2019 ctrip. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11, *) {
            // Use iOS 11 APIs.
        } else {
            // Alternative code for earlier versions of iOS.
        }
        
        let _ = Color.init(r: 1, g: 1, b: 1, alpha: 1)
        let color = Color.init(c: 2, m: 4, y: 5, k: 5)
        let darkenColor = color.darken(amount: 1)
        darkenColor.hue = 1
        print(darkenColor.hue)
        let bondiBlue = Color.bondiBlue
        let _ = Color.calibration
        Color.calibration = bondiBlue
    }
    

    @available(iOS 11, macOS 10.13, *)
    func newMethod() {
        // Use iOS 11 APIs.
        
    }

}
