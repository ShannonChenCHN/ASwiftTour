//
//  ViewController.swift
//  WorldTrotter
//
//  Created by ShannonChen on 2017/2/5.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstView = UIView.init(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        view.addSubview(firstView)
    }



}

